import 'package:pintupay/core/database/box/user/user_box.dart';
import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';

import '../../../core/network/model/core_model.dart';

class ProfileProvider {
  static Future<UserBox> profile({bool isLoading = false}) async {
    var dio = await DioService.checkConnection(
        tryAgainMethod: profile, isLoading: isLoading);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.profile(authUsecase.userBox.authToken!);
    return UserBox.fromJson(result.data);
  }

  static Future<bool> logout() async {
    await DioService.checkConnection(
            isUseBearer: true, tryAgainMethod: logout, isLoading: true)
        .then((dio) async {
      await DioClient(dio).logout();
    });
    return true;
  }

  static checkPin(Map<String, String> map, data) async {
    return await DioService.checkConnection(
            isUseBearer: true, tryAgainMethod: logout, isLoading: true)
        .then((dio) async {
      return await DioClient(dio).checkPIN(data).then((response) {
        return response;
      }, onError: (error, stackTrace) {
        return Future.error(error, stackTrace);
      });
    }, onError: (error, stackTrace) {
      return Future.error(error, stackTrace);
    });
  }

  static Future<CoreModel> updatePin(
      Map<String, dynamic> data) async {
    return await DioService.checkConnection(
            isUseBearer: true, tryAgainMethod: logout, isLoading: true)
        .then((dio) async {
      return await DioClient(dio).updatePIN(data);
    });
  }
}
