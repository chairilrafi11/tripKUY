import 'package:pintupay/core/network/dio_client.dart';
import 'package:pintupay/core/network/dio_service.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa_payment.dart';

class PulsaProvider {

  static Future<ResponsePulsa> pulsa(String phoneNumber) async {
    var dio = await DioService.checkConnection(tryAgainMethod: pulsa);
    DioClient dioClient = DioClient(dio);
    var pulsaProduct = await dioClient.pulsaProduct(phoneNumber, authUsecase.userBox.authToken!);
    return ResponsePulsa.fromJson(pulsaProduct.data);
  } 

  static Future<ResponsePulsa> providerIcon(String phoneNumber) async {
    var dio = await DioService.checkConnection(tryAgainMethod: pulsa);
    DioClient dioClient = DioClient(dio);
    var pulsaProduct = await dioClient.pulsaProvider(phoneNumber, authUsecase.userBox.authToken!);
    return ResponsePulsa.fromJson(pulsaProduct.data);
  } 

  static Future<ResponsePulsaPayment> payment(Map<String, dynamic> pulsaPayment) async {
    var dio = await DioService.checkConnection(tryAgainMethod: pulsa, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var payment = await dioClient.pulsaPayment(pulsaPayment);
    return ResponsePulsaPayment.fromJson(payment.data);
  } 

}