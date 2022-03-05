import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/database/box/user/user_box.dart';
import 'package:pintupay/core/database/box/user/user_box_controller.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/verification/model/register_activation.dart';
import 'package:pintupay/ui/verification/model/register_form_model.dart';
import 'package:pintupay/ui/verification/provider/verification_provider.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  RegisterCubit() : super(RegisterInitial());

  Future onRegisterForm(RegisterFormModel registerFormModel) async {
    var phone = PintuPayCrypt().encrypt(jsonEncode(registerFormModel), await PintuPayCrypt().getPassKeyPref());
    var result = await VerificationProvider.registerForm(PostBody(phone).toJson());
    if(result.id != null){
      UserBox userBox = UserBox.fromJson(result.toJson());
      authUsecase.setUser(userBox);
      UserBoxController.saveUser(userBox);
      pushAndRemoveUntil(Dashboard(), RouterType.material);
    }
  }

  onActivation(RegisterActivation registerActivation) async {
    var otp = PintuPayCrypt().encrypt(jsonEncode(registerActivation), await PintuPayCrypt().getPassKeyPref());
    var result = await VerificationProvider.otpRegist(PostBody(otp).toJson());
    
  }
}
