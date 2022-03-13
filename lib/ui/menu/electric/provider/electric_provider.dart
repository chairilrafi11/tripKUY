import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/electric/model/electric_postpaid_inquiry_response.dart';
import 'package:pintupay/ui/menu/electric/model/electric_postpaid_payment_response.dart';
import 'package:pintupay/ui/menu/electric/model/electric_prepaid_inquiry_response.dart';
import 'package:pintupay/ui/menu/electric/model/electric_token_response.dart';

import '../model/electric_prepaid_payment_response.dart';

class ElectricProvider {

  static Future<ElectricTokenResponse> token() async {
    var dio = await DioService.checkConnection(tryAgainMethod: token, isLoading: false);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricToken(authUsecase.userBox.authToken ?? "");
    return ElectricTokenResponse.fromJson(result.data);
  } 

  static Future<ElectricPospaidInquiryResponse> inquiryPostpaid(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiryPostpaid, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricPostpaidInquiry(body);
    return ElectricPospaidInquiryResponse.fromJson(result.data);
  } 

  static Future<ElectricPospaidPaymentResponse> paymentPostpaid(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: paymentPostpaid, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricPostpaidPayment(body);
    return ElectricPospaidPaymentResponse.fromJson(result.data);
  } 

  static Future<ElectricPrepaidInquiryResponse> inquiryPrepaid(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiryPrepaid, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricPrepaidInquiry(body);
    return ElectricPrepaidInquiryResponse.fromJson(result.data);
  } 

  static Future<ElectricPrepaidPaymentResponse> paymentPrepaid(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: paymentPrepaid, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricPostpaidPayment(body);
    return ElectricPrepaidPaymentResponse.fromJson(result.data);
  } 

}