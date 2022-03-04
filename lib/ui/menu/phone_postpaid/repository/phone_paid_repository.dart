import 'dart:convert';

import 'package:nav_router/nav_router.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_service.dart';
import '../../../../core/util/core_function.dart';
import '../model/phone_postpaid_model.dart';
import '../model/response_inquiry_postpaid.dart';

class PhonePaidRepository {
  List<PhonePostpaidModel>? pascaProviders;
  ResponseInquiryPhonePaid? responseInquiryPasca;
  String? provider;

  Future<List<PhonePostpaidModel>?> getProvider() async {
    await DioService.checkConnection(tryAgainMethod: getProvider)
        .then((dio) async {
      pascaProviders = await DioClient(dio).getProductCellularsPasca();
    });

    return Future.value(pascaProviders);
  }

  Future<ResponseInquiryPhonePaid?> inquiry(
      String custId, String provider) async {
    this.provider = provider;
    return await DioService.checkConnection(
      // baseUrl: BASE_URL.product,
      tryAgainMethod: inquiry,
      isLoading: true,
      params: [
        custId,
        provider,
      ],
    ).then((dio) async {
      return await DioClient(dio).inquiryCellularsPasca({
        "act": "inquiry",
        "no_resi": "",
        "total_payment": "",
        "payment": "",
        "phone_number": custId,
        "product": provider,
        "transaction_code": "",
      }).then((response) {
        responseInquiryPasca =
            ResponseInquiryPhonePaid.fromJson(response.toJson());
        CoreFunction.logPrint(
            'Future inquiry', jsonEncode(responseInquiryPasca));
        return responseInquiryPasca;
      });
    });
  }

  Future<Map<String, dynamic>?> onPayment() async {
    return CoreFunction.showPin(navGK.currentContext!).then((pin) async {
      if ((pin?.isNotEmpty ?? false)) {
        return await DioService.checkConnection(
          // baseUrl: BASE_URL.product,
          tryAgainMethod: onPayment,
          isLoading: true,
        ).then((dio) async {
          return await DioClient(dio).transactionCellularsPasca({
            "pin": pin,
            "act": "payment",
            "balance": "cash",
            "no_resi": responseInquiryPasca?.noResi,
            "total_payment": responseInquiryPasca?.total,
            "payment": responseInquiryPasca?.tagihan,
            "phone_number": responseInquiryPasca?.idPelanggan,
            "product": provider,
            "transaction_id": responseInquiryPasca?.transactionId,
            "transaction_code": responseInquiryPasca?.transactionCode,
          });
        });
      }
    });
  }
}
