import 'dart:convert';

import 'package:nav_router/nav_router.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_service.dart';
import '../../../../core/util/core_function.dart';
import '../../../../core/util/core_variable.dart';
import '../model/district_pdam.dart';
import '../model/response_inquiry_pdam.dart';
import '../model/transaction_pdam.dart';

class PdamRepository {
  List<DistrictPDAM>? pdamDistricts;
  DistrictPDAM? selectedDistrict;
  ResponseInquiryPDAM? responseInquiryPDAM;

  Future<List<DistrictPDAM>?> getPdamDistricts() async {
    pdamDistricts = await DioService.checkConnection(
      // baseUrl: BASE_URL.product,
      tryAgainMethod: getPdamDistricts,
    ).then((dio) async {
      // return await DioClient(dio).getProductPDAM();
    });
    CoreFunction.logPrint(
        'DioService getPdamDistricts', jsonEncode(pdamDistricts));
    return pdamDistricts;
  }

  Future<ResponseInquiryPDAM?> onInquiry(
    String customerId,
    DistrictPDAM? selectedDistrict,
  ) async {
    this.selectedDistrict = selectedDistrict;
    return await DioService.checkConnection(
      // baseUrl: BASE_URL.product,
      tryAgainMethod: onInquiry,
      isLoading: true,
      params: [
        customerId,
        selectedDistrict,
      ],
    ).then((dio) async {
      // return await DioClient(dio).inquiryPDAM({
      //   "act": "inquiry",
      //   "id": customerId,
      //   "product": selectedDistrict?.name,
      //   "product_id": selectedDistrict?.id,
      // }).then((value) {
      //   responseInquiryPDAM = ResponseInquiryPDAM.fromJson(value.toJson());
      //   CoreFunction.logPrint(
      //       'DioService responseInquiryPDAM', jsonEncode(responseInquiryPDAM));
      //   return responseInquiryPDAM;
      // });
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
          // return await DioClient(dio).transactionPDAM(
          //   TransactionPDAM(
          //     transactionId: responseInquiryPDAM?.transactionId ?? -1,
          //     id: responseInquiryPDAM?.noPel ?? '',
          //     productId: selectedDistrict?.id ?? -1,
          //     product: selectedDistrict?.name ?? '',
          //     pin: pin,
          //     act: CoreVariable.payment,
          //     totalPayment: responseInquiryPDAM?.totTagihan.toString(),
          //   ),
          // );
        });
      }
    });
  }
}
