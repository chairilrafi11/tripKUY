import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/menu/electric/model/electric_postpaid_inquiry_model.dart';
import 'package:pintupay/ui/menu/electric/model/electric_postpaid_payment_model.dart';
import 'package:pintupay/ui/menu/electric/model/electric_prepaid_inquiry.dart';
import 'package:pintupay/ui/menu/electric/model/electric_prepaid_payment_request.dart';
import 'package:pintupay/ui/menu/electric/model/electric_token_response.dart';
import 'package:pintupay/ui/menu/electric/provider/electric_provider.dart';

import '../../../../core/network/model/post_body.dart';
import '../../../../core/usecase/view_usecase.dart';
import '../../../bill/model/bill_body_model.dart';
import '../../../bill/model/bill_status_model.dart';
import '../../../bill/view/bill_view.dart';
import '../../../payment/view/payment_view.dart';

part 'electric_state.dart';

class ElectricCubit extends Cubit<ElectricState> {
  ElectricCubit() : super(ElectricLoading()){
    onGetToken();
  }

  List<Set<String>> listInformation = [];
  late ElectricPospaidPaymentModel electricPospaidPaymentModel;
  late ElectricPrepaidPaymentRequest electricPrepaidPaymentRequest;
  late PulsaListrik pulsaListrik;

  Future onGetToken() async {
    var electricTokenResponse = await ElectricProvider.token();
    if(electricTokenResponse.pulsaListrik!.isNotEmpty){
      emit(ElectricLoaded(electricTokenResponse: electricTokenResponse));
    } else {
      emit(ElectricEmpty());
    }
  }

  Future onPostpaidInquiry(String id) async {
    ElectricPospaidInquiryModel electricPospaidInquiryModel = ElectricPospaidInquiryModel(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      categoryId: -1,
      id: id,
      totalPayment: "",
      type: "postpaid"
    );
    var inquiry = PintuPayCrypt().encrypt(jsonEncode(electricPospaidInquiryModel), await PintuPayCrypt().getPassKeyPref());
    var result = await ElectricProvider.inquiryPostpaid(BodyRequestV7(inquiry, inquiry).toJson());

    if(result.idPel != null){
      
      //? Create Object Payment
      ElectricPospaidPaymentModel payment = ElectricPospaidPaymentModel(
        act: "payment",
        authToken: authUsecase.userBox.authToken,
        categoryId: -1,
        id: id,
        transactionId: result.transactionId.toString(),
        totalPayment: result.total.toString(),
        type: "postpaid",
        balance: "cash"
      );

      electricPospaidPaymentModel = payment;

      listInformation = [
        {"Nama Pengguna", result.nama.toString()},
        {"No Pelanggan", result.idPel.toString()},
        {"Daya", result.jmlBlnTagihan.toString()},
        {"PLN Token", result.plnToken.toString()},
        {"No Reff", result.refnum.toString()},
        {"Jumlah Bulan", result.jmlBln.toString()},
        {"Jumlah Bulan Tagihan", result.jmlBlnTagihan.toString()},
        {"Tagihan", CoreFunction.moneyFormatter(result.amount)},
        {"Biaya Admin", CoreFunction.moneyFormatter(result.admin)},
        {"Total Tagihan", CoreFunction.moneyFormatter(result.total)},
      ];

      routePush(
        PaymentView(
          listInformation: listInformation,
          paymentMethod: onPostpaidPayment,
          feature: Feature.electric,
        ), 
        RouterType.material
      );
    }
  }
  
  onPostpaidPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        electricPospaidPaymentModel.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(electricPospaidPaymentModel), await PintuPayCrypt().getPassKeyPref());
        var result = await ElectricProvider.paymentPostpaid(BodyRequestV7(payment, payment).toJson());

        if(result.id != null) {
          BillStatusModel billStatusModel = BillStatusModel(
            billBody: listInformation.map((e){
              return BillBodyModel(e.first, e.last);
            }).toList(),
            status: ""
          );

          routePush(BillView(
            billStatusModel: billStatusModel,
            billStatus: BillStatus.success,
          ));
        }
      }
    });
  }

  Future onPrepaidInquiry(String id, PulsaListrik value) async {
    pulsaListrik = value;
    ElectricPrepaidInquiry electricPrepaidInquiry = ElectricPrepaidInquiry(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      type: "prepaid",
      idPel: id,
      idProduct: 0,
      refnum: ""
    );
    var inquiry = PintuPayCrypt().encrypt(jsonEncode(electricPrepaidInquiry), await PintuPayCrypt().getPassKeyPref());
    var result = await ElectricProvider.inquiryPrepaid(BodyRequestV7(inquiry, inquiry).toJson());

    if(result.idPel != null){
      
      //? Create Object Payment
      ElectricPrepaidPaymentRequest payment = ElectricPrepaidPaymentRequest(
        act: "payment",
        authToken: authUsecase.userBox.authToken,
        type: "prepaid",
        refnum: "",
        idPel: result.idPel,
        idProduct: pulsaListrik.id,
        balance: "cash"
      );

      electricPrepaidPaymentRequest = payment;

      listInformation = [
        {"Nama Pengguna", result.nama.toString()},
        {"No Pelanggan", result.idPel.toString()},
        // {"Daya", result.jmlBlnTagihan.toString()},
        {"PLN Token", result.plnToken.toString()},
        {"No Reff", result.refnum.toString()},
        // {"Jumlah Bulan", result.jmlBln.toString()},
        // {"Jumlah Bulan Tagihan", result.jmlBlnTagihan.toString()},
        {"Tagihan", CoreFunction.moneyFormatter(result.amount)},
        {"Biaya Admin", CoreFunction.moneyFormatter(result.admin)},
        {"Total Tagihan", CoreFunction.moneyFormatter(pulsaListrik.salePrice! + result.admin!)},
      ];

      routePush(
        PaymentView(
          listInformation: listInformation,
          paymentMethod: onPostpaidPayment,
          feature: Feature.electric,
        ), 
        RouterType.material
      );
    }
  }
  
  onPrepaidPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        electricPrepaidPaymentRequest.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(electricPrepaidPaymentRequest), await PintuPayCrypt().getPassKeyPref());
        var result = await ElectricProvider.paymentPrepaid(BodyRequestV7(payment, payment).toJson());

        if(result.id != null) {
          BillStatusModel billStatusModel = BillStatusModel(
            billBody: listInformation.map((e){
              return BillBodyModel(e.first, e.last);
            }).toList(),
            status: ""
          );

          routePush(
            BillView(
              billStatusModel: billStatusModel,
              billStatus: BillStatus.success,
            ),
            RouterType.material
          );
        }
      }
    });
  }

}
