import 'package:flutter/material.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import '../../../core/util/core_function.dart';
import '../../../core/util/size_config.dart';
import '../../component/component.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PintuPayPalette.white,
      appBar: Component.appBar('Contact Us'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildLogo(),
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                padding: const EdgeInsets.all(5),
                color: PintuPayPalette.darkBlue,
                child: const Text(
                  'Anda bisa memberitahu kami dengan salah satu kontak di bawah',
                  style: TextStyle(fontSize: 13, color: PintuPayPalette.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PintuPayPalette.white,
                  elevation: 1.0,
                  shadowColor: PintuPayPalette.grey,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.75,
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onPressed: () {
                  CoreFunction.navToAnotherApps(
                      phoneNumber: '6281314152407',
                      whatsApp: true,
                      message: 'Assalamualaikum admin, saya mau bertanya');
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/icon_wa.png",
                      height: 40,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Component.textDefault('+6281314152407'),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PintuPayPalette.white,
                  elevation: 1.0,
                  shadowColor: PintuPayPalette.grey,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.75,
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onPressed: () {
                  CoreFunction.navToAnotherApps(
                    email: 'radityadean91@gmail.com',
                    message: 'Assalamualaikum admin, saya mau bertanya',
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: PintuPayPalette.green,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Component.textDefault('radityadean91@gmail.com'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/icons/logo_cs.jpg",
            height: SizeConfig.blockSizeHorizontal * 60,
          )
        ],
      ),
    );
  }
}
