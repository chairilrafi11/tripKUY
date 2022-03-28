import 'package:pintupay/core/network/dio_client.dart';
import 'package:pintupay/core/network/dio_service.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/pulsa/model/recent_number_response.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa_payment.dart';

import '../model/pulsa_provider_response.dart';

class PulsaProvider {

  static Future<ResponsePulsa> pulsa(String phoneNumber) async {
    var dio = await DioService.checkConnection(tryAgainMethod: pulsa);
    DioClient dioClient = DioClient(dio);
    var pulsaProduct = await dioClient.pulsaProduct(phoneNumber, authUsecase.userBox.authToken!);
    return ResponsePulsa.fromJson(pulsaProduct.data);
  } 

  static Future<PulsaProviderResponse> providerIcon(String phoneNumber) async {
    var dio = await DioService.checkConnection(tryAgainMethod: pulsa);
    DioClient dioClient = DioClient(dio);
    var pulsaProduct = await dioClient.pulsaProvider(phoneNumber, authUsecase.userBox.authToken!);
    return PulsaProviderResponse.fromJson(pulsaProduct.data);
  } 

  static Future<ResponsePulsaPayment> payment(Map<String, dynamic> pulsaPayment) async {
    var dio = await DioService.checkConnection(tryAgainMethod: pulsa, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var payment = await dioClient.pulsaPayment(pulsaPayment);
    return ResponsePulsaPayment.fromJson(payment.data);
  } 

  static Future<List<RecentNumberResponse>> recent() async {
    List<RecentNumberResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: pulsa, isLoading: false);
    DioClient dioClient = DioClient(dio);
    var payment = await dioClient.recentNumber(authUsecase.userBox.authToken!);
    for (var i = 0; i < payment.data.length; i++) {
      list.add(RecentNumberResponse.fromJson(payment.data[i]));
    }
    return list;
  } 

}