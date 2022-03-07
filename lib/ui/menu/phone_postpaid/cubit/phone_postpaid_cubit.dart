import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/pascabayar_provider_response.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/pascabayar_payment_model.dart';
import 'package:pintupay/ui/menu/phone_postpaid/provider/pascabayar_provider.dart';

import '../../../../core/network/model/post_body.dart';
import '../../../../core/pintupay/pintupay_crypt.dart';
import '../../../../core/usecase/auth_usecase.dart';
import '../../../../core/usecase/view_usecase.dart';
import '../../../../core/util/core_function.dart';
import '../../../bill/model/bill_body_model.dart';
import '../../../bill/model/bill_status_model.dart';
import '../../../bill/view/bill_view.dart';
import '../../../payment/view/payment_view.dart';
import '../model/pascabayar_inquiry_model.dart';

part 'phone_postpaid_state.dart';

class PhonePostpaidCubit extends Cubit<PhonePostpaidState> {
  PhonePostpaidCubit() : super(PascabayarLoading()) {
    onGetProvider();
  }

  List<Set<String>> listInformation = [];
  late PascabayarPaymentModel pascabayarPaymentModel;

  Future<void> onGetProvider() async {
    PascabayarProviderResponse pascabayarProviderResponse = PascabayarProviderResponse();
    var provider = await PascabayarProvider.provider();
    provider.add(pascabayarProviderResponse);
    emit(PascabayarLoaded(
        listProvider: provider, provider: pascabayarProviderResponse));
  }

  void setProvider(PascabayarProviderResponse pascabayarProviderResponse) {
    PascabayarLoaded pascabayarLoaded = state as PascabayarLoaded;
    emit(PascabayarLoaded(
        listProvider: pascabayarLoaded.listProvider,
        provider: pascabayarProviderResponse));
  }

  Future onInquiry(String phoneNumberCustomer) async {
    PascabayarLoaded pascabayarLoaded = state as PascabayarLoaded;
    PascabayarInquiryModel pascabayarInquiryModel = PascabayarInquiryModel(
        action: "inquiry",
        authToken: authUsecase.userBox.authToken,
        phoneNumber: phoneNumberCustomer,
        product: pascabayarLoaded.provider.product,
        trancationId: pascabayarLoaded.provider.id,
        totalPayment: "");
    var inquiry = PintuPayCrypt().encrypt(jsonEncode(pascabayarInquiryModel),
        await PintuPayCrypt().getPassKeyPref());
    var result = await PascabayarProvider.inquiry(
        BodyRequestV7(inquiry, inquiry).toJson());

    if (result.noPel != null) {
      //? Create Object Payment

      PascabayarPaymentModel paymentModel = PascabayarPaymentModel(
        act: "payment",
        authToken: authUsecase.userBox.authToken,
        id: phoneNumberCustomer,
        product: pascabayarLoaded.provider.product,
        productId: pascabayarLoaded.provider.id,
        totalPayment: result.totTagihan.toString(),
      );

      pascabayarPaymentModel = paymentModel;

      listInformation = [
        {"Nama Pengguna", result.nama.toString()},
        {"No Pelanggan", result.noPel.toString()},
        {"No Reff", result.referalNumber.toString()},
        {"Periode", result.periode.toString()},
        {"Stand", result.stand.toString()},
        {"Tagihan", CoreFunction.moneyFormatter(result.tagihan)},
        {"Biaya Admin", CoreFunction.moneyFormatter(result.beaAdmin)},
        {"Total Tagihan", CoreFunction.moneyFormatter(result.totTagihan)},
      ];

      routePush(
          PaymentView(
            listInformation: listInformation,
            paymentMethod: onPayment,
            feature: Feature.pascabayar,
          ),
          RouterType.material);
    }
  }

  Future onPayment() async {
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if (value != null) {
        pascabayarPaymentModel.pin = value;
        var payment = PintuPayCrypt().encrypt(
            jsonEncode(pascabayarPaymentModel),
            await PintuPayCrypt().getPassKeyPref());
        var result = await PascabayarProvider.payment(
            BodyRequestV7(payment, payment).toJson());

        BillStatusModel billStatusModel = BillStatusModel(
            billBody: listInformation.map((e) {
              return BillBodyModel(e.first, e.last);
            }).toList(),
            status: "");

        if (result.nama != null) {
          routePush(BillView(billStatusModel));
        }
      }
    });
  }
}
