import 'package:pintupay/core/network/dio_client.dart';
import 'package:pintupay/core/network/dio_service.dart';
import 'package:pintupay/ui/verification/model/check_phone_number.dart';
import 'package:pintupay/ui/verification/model/otp_register_model.dart';
import 'package:pintupay/ui/verification/model/register_activation.dart';
import 'package:pintupay/ui/verification/model/register_activation_response.dart';
import 'package:pintupay/ui/verification/model/register_form_model.dart';
import 'package:pintupay/ui/verification/model/register_form_response.dart';
import 'package:pintupay/ui/verification/model/response_check_phone_number.dart';

class VerificationProvider {

  static Future<ResponseCheckPhoneNumber> checkPhoneNumber(Map<String, dynamic> checkPhoneNumberModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: checkPhoneNumber, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var data =  await dioClient.checkPhoneNumber(checkPhoneNumberModel);
    return ResponseCheckPhoneNumber.fromJson(data.data);
  }

  static Future<ResponseCheckPhoneNumber> otpRegist(Map<String, dynamic> otpRegisterModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: otpRegist, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var data = await dioClient.registerOtp(otpRegisterModel);
    return ResponseCheckPhoneNumber.fromJson(data.data);
  }

  static Future<RegisterFormResponse> registerForm(Map<String, dynamic> registerFormModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: registerForm, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var data = await dioClient.registerForm(registerFormModel);
    return RegisterFormResponse.fromJson(data.data);
  }

  static Future<RegisterActivationResponse> activation(Map<String, dynamic> registerActivation) async {
    var dio = await DioService.checkConnection(tryAgainMethod: activation);
    DioClient dioClient = DioClient(dio);
    var data = await dioClient.registerVerif(registerActivation);
    return RegisterActivationResponse.fromJson(data.data);
  }

}