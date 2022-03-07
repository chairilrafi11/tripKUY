import 'package:pintupay/core/database/box/user/user_box.dart';
import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';

class ProfileProvider {

  static Future<UserBox> profile() async {
    var dio = await DioService.checkConnection(tryAgainMethod: profile);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.profile(authUsecase.userBox.authToken!);
    return UserBox.fromJson(result.data);
  } 
}