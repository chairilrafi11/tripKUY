import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/pascabayar_provider_response.dart';

import '../model/pascabayar_inquiry_response.dart';

class PascabayarProvider {
  static Future<List<PascabayarProviderResponse>> provider() async {
    List<PascabayarProviderResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: provider);
    DioClient dioClient = DioClient(dio);
    var result =
        await dioClient.pasbayarProduct(authUsecase.userBox.authToken ?? "");
    for (var i = 0; i < result.data.length; i++) {
      list.add(PascabayarProviderResponse.fromJson(result.data[i]));
    }
    return list;
  }

  static Future<PascabayarInquiryResponse> inquiry(
      Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(
        tryAgainMethod: provider, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.pasbayarInquiry(inquiryModel);
    return PascabayarInquiryResponse.fromJson(result.data);
  }

  static Future<PascabayarInquiryResponse> payment(
      Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(
        tryAgainMethod: provider, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.pascabayarPayment(inquiryModel);
    return PascabayarInquiryResponse.fromJson(result.data);
  }
}
