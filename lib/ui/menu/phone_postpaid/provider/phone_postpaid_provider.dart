import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_inquiry_response.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_payment_response.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_provider_response.dart';

import '../../../../core/network/network.dart';

class PhonePostpaidProvider {

  static Future<List<PhonePostpaidProviderResponse>> provider() async {
    List<PhonePostpaidProviderResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: provider);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.phonePostpaidProvider(authUsecase.userBox.authToken ?? "");
    for (var i = 0; i < result.data.length; i++) {
      list.add(PhonePostpaidProviderResponse.fromJson(result.data[i]));
    }
    return list;
  } 

  static Future<PhonePostpaidInquiryResponse> inquiry(Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.phonePostpaidInquiry(inquiryModel);
    return PhonePostpaidInquiryResponse.fromJson(result.data);
  } 

  static Future<PhonePostpaidPaymentResponse> payment(Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: payment, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.phonePostpaidPayment(inquiryModel);
    return PhonePostpaidPaymentResponse.fromJson(result.data);
  } 
}