import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/forgot_password/model/forgot_password_model.dart';
import 'package:pintupay/ui/login/view/login.dart';
import '../../../core/network/model/post_body.dart';
import '../../../core/pintupay/pintupay_crypt.dart';
import '../../../core/util/util.dart';
import '../../component/component.dart';
import '../provider/forgot_password_provider.dart';
import '../view/forgot_password_form.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  Future<void> onRequestOTP(String phoneNumber) async {
    if (phoneNumber.substring(0, 2) == '08' ||
        phoneNumber.substring(0, 2) == '62' ||
        phoneNumber.substring(0, 2) == '+62' ||
        phoneNumber.substring(0, 1) == '8') {
      ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel(
        phoneNumber : phoneNumber);
      var bodyRequest = PintuPayCrypt().encrypt(jsonEncode(forgotPasswordModel),
          await PintuPayCrypt().getPassKeyPref());
      var result = await ForgotPasswordProvider.onRequestOTP(
          BodyRequestV7(bodyRequest, bodyRequest).toJson());
      if (result.phoneNumber != null) {
        await ForgotPasswordProvider.onRequestOTP(
                BodyRequestV7(bodyRequest, bodyRequest).toJson())
            .then((response) {
          routePush(BlocProvider(
            create: (context) => this,
            child: ForgotPasswordForm(
              secretKey: bodyRequest,
              isFromUpdatePassword: false,
            ),
          ));
        });
      } else {}
    }
  }

  Future<void> onRequestForgotPassword({
    required String otp,
    required String newPassword,
    required String confirmNewPassword,
    required String phoneNumber,
    required bool isFromUpdatePassword,
  }) async {
    await ForgotPasswordProvider.onRequestForgotPassword({
      'key': otp,
      'password': newPassword,
      'password_confirmation': confirmNewPassword,
      'phone_number': phoneNumber,
    }).then((response) {
      Component.showDialogWithRichText(
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: isFromUpdatePassword
                ? 'Berhasil mengganti password\n'
                : 'Berhasil mengganti password\nSilahkan Login Kembali\n',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            children: const [
              TextSpan(
                text: 'Sentuh dimana saja untuk kembali',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ).then((_) {
        if (isFromUpdatePassword) {
          pushAndRemoveUntil(Dashboard());
        } else {
          pushAndRemoveUntil(const Login());
        }
      });
    });
  }
}
