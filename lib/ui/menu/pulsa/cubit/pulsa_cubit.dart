import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

import '../model/pulsa_provider_response.dart';
import '../model/recent_number_response.dart';

part 'pulsa_state.dart';

class PulsaCubit extends Cubit<PulsaState> {

  PulsaCubit() : super(PulsaInitial()){
    history();
  }

  late PulsaPaymentModel pulsaPaymentModel;
  List<Set<String>> listInformation = [];

  onInquiry(String phoneNumber) async {
    emit(PulsaLoading());
    var responsePulsa = await PulsaProvider.pulsa(phoneNumber);
    var provider = await PulsaProvider.providerIcon(phoneNumber);
    if(responsePulsa.pulsa != null) {
      emit(PulsaLoaded(
        responsePulsa: responsePulsa,
        pulsaProviderResponse: provider
      ));
    } else {
      emit(PulsaEmpty());
    }
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

          routePush(
            BillView(
              billStatusModel: billStatusModel,
              messages: result.messages,
              billStatus: BillStatus.pending,
            ),
            RouterType.material
          );
        }
      }
    });
  }

  confirm(Pulsa pulsa, String phoneNumber){

    listInformation = [
      {"Provider", pulsa.providerName ?? ""},
      {"Produk", pulsa.name ?? ""},
      {"No Pengguna", phoneNumber},
      {"Harga", CoreFunction.moneyFormatter(pulsa.price)},
      {"Total Pembayaran", CoreFunction.moneyFormatter(pulsa.price)},
    ];

    pulsaPaymentModel = PulsaPaymentModel(
      authToken: authUsecase.userBox.authToken!,
      payment: true,
      transaction: Transaction(
        balance: "cash",
        indentifierNumber: phoneNumber,
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

  confirmData(Data data, String phoneNumber){

    listInformation = [
      {"Provider", data.providerName ?? ""},
      {"Produk", data.name ?? ""},
      {"No Pengguna", phoneNumber},
      {"Harga", CoreFunction.moneyFormatter(data.price)},
      {"Total Pembayaran", CoreFunction.moneyFormatter(data.price)},
    ];

    pulsaPaymentModel = PulsaPaymentModel(
      authToken: authUsecase.userBox.authToken!,
      payment: true,
      transaction: Transaction(
        balance: "cash",
        indentifierNumber: phoneNumber,
        messages: data.name,
        productPriceId: data.id,
        providerId: data.id,
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

  history() async {
    emit(PulsaLoading());
    emit(PulsaRecentNumber(listRecent: await PulsaProvider.recent()));
  }

}
