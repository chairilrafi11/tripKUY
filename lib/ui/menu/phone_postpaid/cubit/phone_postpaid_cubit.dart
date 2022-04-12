import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_inquiry_model.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_payment_model.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_provider_response.dart';
import 'package:pintupay/ui/menu/phone_postpaid/provider/phone_postpaid_provider.dart';

import '../../../../core/network/model/post_body.dart';
import '../../../../core/usecase/view_usecase.dart';
import '../../../bill/model/bill_body_model.dart';
import '../../../bill/model/bill_status_model.dart';
import '../../../bill/view/bill_view.dart';
import '../../../payment/view/payment_view.dart';

part 'phone_postpaid_state.dart';

class PhonePostpaidCubit extends Cubit<PhonePostpaidState> {
  PhonePostpaidCubit() : super(PhonePostpaidLoading()) {
    onGetProvider();
  }

  List<Set<String>> listInformation = [];
  late PhonePostpaidProviderResponse phonePostpaidProviderResponse;
  late PhonePostpaidPaymentModel phonePostpaidPaymentModel;

  Future onGetProvider() async {
    emit(PhonePostpaidLoaded(
      listProvider: await PhonePostpaidProvider.provider(), 
      phonePostpaidProviderResponse: PhonePostpaidProviderResponse()
    ));
  }

  void setProvder(PhonePostpaidProviderResponse value){
    phonePostpaidProviderResponse = value;
  }

  Future onInquiry(String customerId) async {

    PhonePostpaidInquiryModel phonePostpaidInquiryModel = PhonePostpaidInquiryModel(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      phoneNumber: customerId,
      payment: "",
      noResi: "",
      product: phonePostpaidProviderResponse.product,
      totalPayment: "",
      transactionCode: ""
    );
    
    var inquiry = PintuPayCrypt().encrypt(jsonEncode(phonePostpaidInquiryModel), await PintuPayCrypt().getPassKeyPref());
    var result = await PhonePostpaidProvider.inquiry(BodyRequestV7(inquiry, inquiry).toJson());

    if(result.transactionId != null){
      
      //? Create Object Payment
      
      PhonePostpaidPaymentModel paymentModel = PhonePostpaidPaymentModel(
         act: "inquiry",
          authToken: authUsecase.userBox.authToken,
          phoneNumber: customerId,
          payment: "",
          noResi: "",
          product: phonePostpaidProviderResponse.product,
          totalPayment: "",
          balance: "cash",
          transactionCode: result.transactionCode,
          transactionId: result.transactionId.toString()
      );

      phonePostpaidPaymentModel = paymentModel;

      listInformation = [
        {"Jenis Transaksi", "HP Pascabayar"},
        {"Nama Pengguna", result.nama.toString()},
        {"No Pelanggan", result.idPelanggan.toString()},
        {"No Reff", result.noResi.toString()},
        {"Produk", phonePostpaidProviderResponse.name ?? ""},
        {"Tagihan", CoreFunction.moneyFormatter(result.tagihan)},
        {"Biaya Admin", CoreFunction.moneyFormatter(result.admin)},
        {"Total Tagihan", CoreFunction.moneyFormatter(result.total)},
      ];

      routePush(
        PaymentView(
          listInformation: listInformation,
          paymentMethod: onPayment,
          feature: Feature.phone,
        ), 
        RouterType.material
      );
    }
  }

  Future onPayment() async {
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        phonePostpaidPaymentModel.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(phonePostpaidPaymentModel), await PintuPayCrypt().getPassKeyPref());
        var result = await PhonePostpaidProvider.payment(BodyRequestV7(payment, payment).toJson());

        BillStatusModel billStatusModel = BillStatusModel(
          billBody: listInformation.map((e){
            return BillBodyModel(e.first, e.last);
          }).toList(),
          status: ""
        );

        if(result.id != null){
          routePush(
            BillView(
              billStatusModel: billStatusModel,
              billStatus: BillStatus.success,
            )
          );
        }
      }
    });
  }

}
