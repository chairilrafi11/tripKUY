import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/verification/model/register_activation.dart';
import 'package:pintupay/ui/verification/model/register_form_model.dart';
import 'package:pintupay/ui/verification/provider/verification_provider.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  RegisterCubit() : super(RegisterInitial());

  onRegisterForm(RegisterFormModel registerFormModel) async {
    var phone = PintuPayCrypt().encrypt(jsonEncode(registerFormModel), await PintuPayCrypt().getPassKeyPref());
    var result = await VerificationProvider.registerForm(PostBody(phone).toJson());
    CoreFunction.logPrint("Data", result.toJson());
  }

  onActivation(RegisterActivation registerActivation) async {
    var otp = PintuPayCrypt().encrypt(jsonEncode(registerActivation), await PintuPayCrypt().getPassKeyPref());
    var result = await VerificationProvider.otpRegist(PostBody(otp).toJson());
    
  }
}
