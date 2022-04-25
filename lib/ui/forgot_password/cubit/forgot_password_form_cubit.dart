import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/util/util.dart';
import '../../component/component.dart';
import '../../dashboard/view/dashboard.dart';
import '../../login/view/login_view.dart';
import '../provider/forgot_password_provider.dart';

part 'forgot_password_form_state.dart';

class ForgotPasswordFormCubit extends Cubit<ForgotPasswordFormState> {
  ForgotPasswordFormCubit() : super(ForgotPasswordFormInitial());

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
          pushAndRemoveUntil(const LoginView());
        }
      });
    });
  }
}
