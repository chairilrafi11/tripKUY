import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/bill/model/bill_body_model.dart';
import 'package:pintupay/ui/bill/model/bill_status_model.dart';
import 'package:pintupay/ui/bill/view/bill_view.dart';
import 'package:pintupay/ui/menu/bpjs/model/bpjs_inquiry_model.dart';
import 'package:pintupay/ui/menu/bpjs/model/bpjs_payment_model.dart';
import 'package:pintupay/ui/menu/bpjs/provider/bpjs_provider.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';

part 'bpjs_state.dart';

class BpjsCubit extends Cubit<BpjsState> {

  BpjsCubit() : super(BpjsInitial());

  late BPJSPaymentModel bpjsPaymentModel;
  List<Set<String>> listInformation = [];

  Future onInquiry(String number, String month) async {
    BPJSInquiryModel bpjsInquiryModel = BPJSInquiryModel(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      numbers: month,
      van: number
    );
    var bpjsInquiry = PintuPayCrypt().encrypt(jsonEncode(bpjsInquiryModel), await PintuPayCrypt().getPassKeyPref());
    var result = await BPJSProvider.inquiry(BodyRequestV7(bpjsInquiry ,bpjsInquiry).toJson());

    if(result.noVa != null){
      
      //? Create Object Payment
      BPJSPaymentModel bpjsPayment = BPJSPaymentModel(
        act: "payment",
        authToken: authUsecase.userBox.authToken,
        numbers: month,
        totalPayment: result.totTagihan.toString(),
        van: number,
        balance: "cash",
        transactionId: result.transactionId.toString()
      );

      bpjsPaymentModel = bpjsPayment;

      listInformation = [
        {"Nama Pengguna", result.nama.toString()},
        {"No Pelanggan", result.noVa.toString()},
        {"No Reff", result.reff.toString()},
        {"Nama Cabang", result.namaCabang.toString()},
        {"Periode", result.periode.toString()},
        {"Tagihan", CoreFunction.moneyFormatter(result.tagihan)},
        {"Biaya Admin", CoreFunction.moneyFormatter(result.beaAdmin)},
        {"Total Tagihan", CoreFunction.moneyFormatter(result.totTagihan)},
      ];

      routePush(
        PaymentView(
          listInformation: listInformation,
          paymentMethod: onPayment,
          feature: Feature.bpjs,
        ), 
        RouterType.material
      );
    }
  }
  
  onPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        bpjsPaymentModel.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(bpjsPaymentModel), await PintuPayCrypt().getPassKeyPref());
        var result = await BPJSProvider.payment(BodyRequestV7(payment, payment).toJson());

        if(result.noVa != null) {
          BillStatusModel billStatusModel = BillStatusModel(
            billBody: listInformation.map((e){
              return BillBodyModel(e.first, e.last);
            }).toList(),
            status: ""
          );

          routePush(BillView(
            billStatusModel
          ));
        }
      }
    });
  }

}
