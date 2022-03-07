import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/electric/model/electric_postpaid_inquiry_response.dart';
import 'package:pintupay/ui/menu/electric/model/electric_postpaid_payment_response.dart';
import 'package:pintupay/ui/menu/electric/model/electric_token_response.dart';

class ElectricProvider {

  static Future<ElectricTokenResponse> token() async {
    var dio = await DioService.checkConnection(tryAgainMethod: token, isLoading: false);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricToken(authUsecase.userBox.authToken ?? "");
    return ElectricTokenResponse.fromJson(result.data);
  } 

  static Future<ElectricPospaidInquiryResponse> inquiry(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricPostpaidInquiry(body);
    return ElectricPospaidInquiryResponse.fromJson(result.data);
  } 

  static Future<ElectricPospaidPaymentResponse> payment(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.electricPostpaidPayment(body);
    return ElectricPospaidPaymentResponse.fromJson(result.data);
  } 

}