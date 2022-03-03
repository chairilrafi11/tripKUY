import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';

class ProfileProvider {

  static Future profile() async {
    var dio = await DioService.checkConnection(tryAgainMethod: profile);
    DioClient dioClient = DioClient(dio);
    var pulsaProduct = await dioClient.profile(authUsecase.responseLogin.authToken!);
    // return ResponsePulsa.fromJson(pulsaProduct.data);
  } 
}