import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:flutter/material.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/verification/cubit/check_phone_number_cubit.dart';
import 'package:pintupay/ui/verification/model/otp_register_model.dart';
import 'package:pintupay/ui/verification/model/response_check_phone_number.dart';

class AccountVerification extends StatelessWidget {

  final ResponseCheckPhoneNumber responseCheckPhoneNumber;

  AccountVerification({required this.responseCheckPhoneNumber, Key? key})
    : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 20,
              ),
              Component.textDefault(
                'Verifikasi Kode',
                colors: PintuPayPalette.darkBlue,
                fontSize: 30,
                maxLines: 5,
                fontWeight: FontWeight.bold
              ),
              const SizedBox(
                height: 20,
              ),
              Component.textDefault(
                'Kami baru saja mengirim kode ke nomor Whatsapp kamu',
                colors: PintuPayPalette.blue1,
                textAlign: TextAlign.center,
                fontSize: PintuPayConstant.fontSizeLarge,
                maxLines: 5,
                fontWeight: FontWeight.bold
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                child: PinCodeTextField(
                  length: 4, 
                  appContext: context, 
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  onChanged: (String value) { 
                    CoreFunction.logPrint("Code", value);
                    if (value.length == 4){
                      code = value;
                      CheckPhoneNumberCubit().onCheckOTP(OtpRegisterModel(
                        id: responseCheckPhoneNumber.id,
                        otpCode: value,
                        phoneNumber: responseCheckPhoneNumber.phoneNumber
                      ));
                    }
                  },
                )
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
