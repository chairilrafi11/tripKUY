import 'package:pintupay/core/network/dio_client.dart';
import 'package:pintupay/core/network/dio_service.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_payment_response.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_product_response.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_provder.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa.dart';

class EmoneyProvider {

  static Future<List<EmoneyProviderResponse>> provider() async {
    List<EmoneyProviderResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: provider);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.empneyProvider();
    for (var i = 0; i < result.data.length; i++) {
      list.add(EmoneyProviderResponse.fromJson(result.data[i]));
    }
    return list;
  } 

  static Future<EmoneyProductResponse> providerDetail(String provideId) async {
    var dio = await DioService.checkConnection(tryAgainMethod: providerDetail);
    DioClient dioClient = DioClient(dio);
    var product = await dioClient.empneyProviderDetail(provideId, authUsecase.userBox.authToken!);
    return EmoneyProductResponse.fromJson(product.data);
  } 

  static Future<EmoneyPaymentResponse> payment(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: providerDetail, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var product = await dioClient.emoneyPayment(body);
    return EmoneyPaymentResponse.fromJson(product.data);
  } 

}