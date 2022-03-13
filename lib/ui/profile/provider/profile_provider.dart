import 'package:pintupay/core/database/box/user/user_box.dart';
import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';

class ProfileProvider {

  static Future<UserBox> profile({bool isLoading = false}) async {
    var dio = await DioService.checkConnection(tryAgainMethod: profile, isLoading: isLoading);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.profile(authUsecase.userBox.authToken!);
    return UserBox.fromJson(result.data);
  } 
}