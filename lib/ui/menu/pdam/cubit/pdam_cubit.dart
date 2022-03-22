import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/ui/bill/model/bill_body_model.dart';
import 'package:pintupay/ui/bill/model/bill_status_model.dart';
import 'package:pintupay/ui/bill/view/bill_view.dart';
import 'package:pintupay/ui/menu/pdam/model/pdam_disctric_response.dart';
import 'package:pintupay/ui/menu/pdam/model/pdam_inquiry_model.dart';
import 'package:pintupay/ui/menu/pdam/model/pdam_payment_model.dart';
import 'package:pintupay/ui/menu/pdam/provider/pdam_provider.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';

import '../../../../core/util/core_function.dart';

part 'pdam_state.dart';

class PdamCubit extends Cubit<PdamState> {
  PdamCubit() : super(PDAMLoading()) {
    onGetDistrict();
  }

  List<Set<String>> listInformation = [];
  late PDAMPaymentModel pdamPaymentModel;

  Future<void> onGetDistrict() async {
    PDAMDistricResponse pdamDistricResponse = PDAMDistricResponse();
    var districs = await PDAMProvider.distric();
    districs.add(pdamDistricResponse);
    emit(PDAMLoaded(
      listDistric: districs,
      distric: pdamDistricResponse
    ));
  }

  void setDistric(PDAMDistricResponse pdamDistricResponse){
    PDAMLoaded pdamLoaded = state as PDAMLoaded;
    emit(PDAMLoaded(
      listDistric: pdamLoaded.listDistric,
      distric: pdamDistricResponse
    ));
  }

  Future onInquiry(String customerId) async {
    PDAMLoaded pdamLoaded = state as PDAMLoaded;
    PDAMInquiryModel pdamInquiryModel = PDAMInquiryModel(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      id: customerId,
      product: pdamLoaded.distric.name,
      productId: pdamLoaded.distric.id,
      totalPayment: ""
    );
    var inquiry = PintuPayCrypt().encrypt(jsonEncode(pdamInquiryModel), await PintuPayCrypt().getPassKeyPref());
    var result = await PDAMProvider.inquiry(BodyRequestV7(inquiry, inquiry).toJson());

    if(result.noPel!= null){
      
      //? Create Object Payment
      
      PDAMPaymentModel paymentModel = PDAMPaymentModel(
        act: "payment",
        authToken: authUsecase.userBox.authToken,
        id: customerId,
        product: pdamLoaded.distric.name,
        productId: pdamLoaded.distric.id,
        totalPayment: result.totTagihan.toString(),
      );

      pdamPaymentModel = paymentModel;

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
          feature: Feature.pdam,
        ), 
        RouterType.material
      );
    }
  }

  Future onPayment() async {
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        pdamPaymentModel.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(pdamPaymentModel), await PintuPayCrypt().getPassKeyPref());
        var result = await PDAMProvider.payment(BodyRequestV7(payment, payment).toJson());

        BillStatusModel billStatusModel = BillStatusModel(
          billBody: listInformation.map((e){
            return BillBodyModel(e.first, e.last);
          }).toList(),
          status: ""
        );

        if(result.nama != null){
          routePush(BillView(
            billStatusModel
          ));
        }
      }
    });
  }

}
