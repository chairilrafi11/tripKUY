import 'package:benpay/core/benpay_palette.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/util/size_config.dart';
import '../../login/view/login.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({Key? key}) : super(key: key);

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
          child: Stack(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 250.0),
                    child: Text('Verifikasi Akun',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text('Kami baru saja mengirim kode untukmu..',
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 10.0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      onChanged: (value) {
                        print(value);
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
                            color: BenpayPalette.darkBlue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
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
                        primary: BenpayPalette.darkBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {
                        routePush(const Login(), RouterType.cupertino);
                      },
                      child: Text(
                        'Lanjut',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.screenHeight / 60),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonNext() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () => routePush(const Login(), RouterType.cupertino),
        child:
            // Container(
            //   width: SizeConfig.blockSizeHorizontal * 100,
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   alignment: FractionalOffset.bottomCenter,
            //   color: BenpayPalette.darkBlue,
            //   child: Component.textBold("Lanjut", colors: BenpayPalette.white),
            // ),
            Container(
          margin: const EdgeInsets.only(top: 10),
          height: SizeConfig.screenHeight / 20,
          width: SizeConfig.screenWidth / 1.35,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: BenpayPalette.darkBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            onPressed: () {
              routePush(const OTPVerification(), RouterType.cupertino);
            },
            child: Text(
              'Lanjut',
              style: TextStyle(
                  color: Colors.white, fontSize: SizeConfig.screenHeight / 60),
            ),
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
