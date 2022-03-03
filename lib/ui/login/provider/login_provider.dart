import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/ui/login/model/response_login.dart';

class LoginProvider {

  static Future<ResponseLogin> login(Map<String, dynamic> loginModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: login, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var data = await dioClient.loginSessions(loginModel);
    return ResponseLogin.fromJson(data.data);
  }
}