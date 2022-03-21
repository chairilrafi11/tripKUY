import 'package:pintupay/ui/forgot_password/model/forgot_password_model.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/network/dio_service.dart';

class ForgotPasswordProvider {
  ForgotPasswordProvider._();

  static Future<ForgotPasswordModel> onRequestOTP(
      Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(
        tryAgainMethod: onRequestOTP, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.requestOTPForgotPassword(body);
    return ForgotPasswordModel.fromJson(result.data);
  }

  static onRequestForgotPassword(Map<String, String> map) {}
}
