import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/ui/forgot_password/cubit/forgot_password_form_cubit.dart';
import 'package:pintupay/ui/forgot_password/model/forgot_password_model.dart';
import '../../../core/network/model/post_body.dart';
import '../../../core/pintupay/pintupay_crypt.dart';
import '../../../core/util/util.dart';
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
      ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel(phoneNumber : phoneNumber);
      var bodyRequest = PintuPayCrypt().encrypt(jsonEncode(forgotPasswordModel), await PintuPayCrypt().getPassKeyPref());
      var result = await ForgotPasswordProvider.onRequestOTP(PostBody(bodyRequest).toJson());
      // if (result.phoneNumber != null) {
        // await ForgotPasswordProvider.onRequestOTP(PostBody(bodyRequest).toJson()).then((response) {
          routePush(BlocProvider(
            create: (context) => ForgotPasswordFormCubit(),
            child: ForgotPasswordForm(
              secretKey: bodyRequest,
              isFromUpdatePassword: false,
            ),
          ));
        // });
      // } else {}
    }
  }
}
