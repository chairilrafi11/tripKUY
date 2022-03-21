import 'package:pintupay/core/network/dio_client.dart';
import 'package:pintupay/core/network/dio_service.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_payment_response.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_product_response.dart';
import 'package:pintupay/ui/menu/game/model/game_product_response.dart';
import 'package:pintupay/ui/menu/game/model/game_provder_response.dart';

import '../model/game_payment_response.dart';

class GameProvider {

  static Future<List<GameProviderResponse>> provider() async {
    List<GameProviderResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: provider);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.gameProvider();
    for (var i = 0; i < result.data.length; i++) {
      list.add(GameProviderResponse.fromJson(result.data[i]));
    }
    return list;
  } 

  static Future<GameProductResponse> providerDetail(String provideId) async {
    var dio = await DioService.checkConnection(tryAgainMethod: providerDetail);
    DioClient dioClient = DioClient(dio);
    var product = await dioClient.gameProviderDetail(provideId, authUsecase.userBox.authToken!);
    return GameProductResponse.fromJson(product.data);
  } 

  static Future<GamePaymentResponse> payment(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: providerDetail, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var product = await dioClient.gamePayment(body);
    return GamePaymentResponse.fromJson(product.data);
  } 

}