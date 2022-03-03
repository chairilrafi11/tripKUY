import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/login/model/login_model.dart';
import 'package:pintupay/ui/login/model/response_login.dart';
import 'package:pintupay/ui/login/provider/login_provider.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future onLogin(LoginModel loginModel) async {
    // String? fcm = await CoreFunction.generateFirebaseToken();
    // CoreFunction.logPrint("FCM", fcm.toString());
    var login = PintuPayCrypt().encrypt(jsonEncode(loginModel), await PintuPayCrypt().getPassKeyPref());
    ResponseLogin responseLogin = await LoginProvider.login(PostBody(login).toJson());
    authUsecase.setResponseLogin(responseLogin);
    pushAndRemoveUntil(Dashboard(), RouterType.material);
  }
}
