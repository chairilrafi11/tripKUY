import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pintupay/ui/verification/cubit/check_phone_number_cubit.dart';
import 'package:pintupay/ui/verification/model/otp_register_model.dart';
import 'package:pintupay/ui/verification/model/response_check_phone_number.dart';

import '../../../core/util/size_config.dart';
import '../../login/view/login.dart';

class OTPVerification extends StatelessWidget {

  final ResponseCheckPhoneNumber responseCheckPhoneNumber;

  OTPVerification({required this.responseCheckPhoneNumber, Key? key}) : super(key: key);

  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/header_login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 250.0),
                child: Text(
                  'Verifikasi Akun',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Kami baru saja mengirim kode untukmu..',
                  textAlign: TextAlign.center
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    print(value);
                    code = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: buildTimer(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Kirim ulang",
                    style: TextStyle(
                      color: PintuPayPalette.darkBlue,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: SizeConfig.screenHeight / 20,
                width: SizeConfig.screenWidth / 1.35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: PintuPayPalette.darkBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    CheckPhoneNumberCubit().onCheckOTP(OtpRegisterModel(
                      id: responseCheckPhoneNumber.id,
                      otpCode: code,
                      phoneNumber: responseCheckPhoneNumber.phoneNumber
                    ));
                  },
                  child: Text(
                    'Lanjut',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.screenHeight / 60
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Berakhir dalam "),
        TweenAnimationBuilder(
          tween: Tween(begin: 59.0, end: 0.0),
          duration: const Duration(seconds: 59),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
