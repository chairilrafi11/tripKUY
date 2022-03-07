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
import 'package:pintupay/ui/menu/telephone_postpaid/model/telephone_inquiry.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/model/telephone_payment_model.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/provider/telephone_provider.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';

part 'telephone_state.dart';

class TelephoneCubit extends Cubit<TelephoneState> {

  TelephoneCubit() : super(TelephoneInitial());

  late TelephonePaymentModel telephonePaymentModel;
  List<Set<String>> listInformation = [];

  Future onInquiry(String number) async {
   TelephoneInquiryModel telephoneInquiryModel = TelephoneInquiryModel(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      categoryId: -1,
      id: number,
      totalPayment: ""
    );
    var telephoneInquiry = PintuPayCrypt().encrypt(jsonEncode(telephoneInquiryModel), await PintuPayCrypt().getPassKeyPref());
    var result = await TelephoneProvider.inquiry(BodyRequestV7(telephoneInquiry, telephoneInquiry).toJson());

    if(result.idPelanggan != null){
      
      //? Create Object Payment
      TelephonePaymentModel telephonePayment = TelephonePaymentModel(
        act: "payment",
        authToken: authUsecase.userBox.authToken,
        categoryId: -1,
        id: number,
        totalPayment: "",
        balance: "cash",
        transactionId: result.transactionId.toString()
      );

      telephonePaymentModel = telephonePayment;

      listInformation = [
        {"Nama Pengguna", result.namaPelanggan.toString()},
        {"No Pelanggan", result.idPelanggan.toString()},
        {"No Reff", result.refnum.toString()},
        {"Periode", result.periode.toString()},
        {"Daya", result.daya.toString()},
        {"Tagihan", CoreFunction.moneyFormatter(result.totalBill)},
        {"Biaya Admin", CoreFunction.moneyFormatter(result.admin)},
        {"Total Tagihan", CoreFunction.moneyFormatter(result.total)},
      ];

      routePush(
        PaymentView(
          listInformation: listInformation,
          paymentMethod: onPayment,
          feature: Feature.telephone,
        ), 
        RouterType.material
      );
    }
  }
    
  onPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        telephonePaymentModel.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(telephonePaymentModel), await PintuPayCrypt().getPassKeyPref());
        var result = await TelephoneProvider.payment(BodyRequestV7(payment, payment).toJson());

        if(result.id != null){

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
