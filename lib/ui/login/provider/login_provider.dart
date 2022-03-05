import 'package:pintupay/core/database/box/user/user_box.dart';
import 'package:pintupay/core/network/network.dart';

class LoginProvider {

  static Future<UserBox> login(Map<String, dynamic> loginModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: login, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var data = await dioClient.loginSessions(loginModel);
    return UserBox.fromJson(data.data);
  }
}