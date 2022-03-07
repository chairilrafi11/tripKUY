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
import 'package:pintupay/ui/menu/pulsa/model/pulsa_payment_model.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa.dart';
import 'package:pintupay/ui/menu/pulsa/provider/pulsa_provider.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';

part 'pulsa_state.dart';

class PulsaCubit extends Cubit<PulsaState> {

  PulsaCubit() : super(PulsaInitial());

  late PulsaPaymentModel pulsaPaymentModel;
  List<Set<String>> listInformation = [];

  onInquiry(String phoneNumber) async {
    emit(PulsaLoading());
    var responsePulsa = await PulsaProvider.pulsa(phoneNumber);
    // var responsePuls = await PulsaProvider.providerIcon(phoneNumber);
    emit(PulsaLoaded(responsePulsa: responsePulsa));
  }

  onPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        pulsaPaymentModel.pin = value;
        var pulsaPayment = PintuPayCrypt().encrypt(jsonEncode(pulsaPaymentModel), await PintuPayCrypt().getPassKeyPref());
        var result = await PulsaProvider.payment(BodyRequestV7(pulsaPayment, pulsaPayment).toJson());
        
        if(result.authToken != null){
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

  confirm(Pulsa pulsa, String phoneNumber){

    listInformation = [
      {"Provider", "Three"},
      {"Produk", pulsa.name ?? ""},
      {"No Pengguna", phoneNumber},
      {"Harga", CoreFunction.moneyFormatter(pulsa.price)},
    ];

    pulsaPaymentModel = PulsaPaymentModel(
      authToken: authUsecase.userBox.authToken!,
      payment: true,
      transaction: Transaction(
        balance: "cash",
        indentifierNumber: "08985722049",
        messages: pulsa.name,
        productPriceId: pulsa.id,
        providerId: pulsa.id,
        time: 1,
        transactionTypeId: 1,
        userId: authUsecase.userBox.id
      )
    );

    routePush(PaymentView(
      listInformation: listInformation,
      paymentMethod: onPayment,
      feature: Feature.pulsa,
    ), RouterType.material);
  }
}
