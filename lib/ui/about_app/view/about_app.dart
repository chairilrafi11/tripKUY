import 'package:flutter/material.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/util.dart';
import '../../component/component.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar('Tentang Aplikasi'),
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeConfig.blockSizeVertical * 10),
            Image.asset('assets/icons/logo.png', height: SizeConfig.blockSizeVertical * 20,),
            Component.textBold(
              CoreFunction.version(),
              textAlign: TextAlign.center,
              fontSize: PintuPayConstant.fontSizeLargeExtra
            ),
            const SizedBox(height: 20,),
            Component.textDefault(
              "Aplikasi PintuPay merupakan aplikasi yang dikembangkan oleh Beben Alex, aplikasi ini bisa dijadikan alat transaksi PPOB",
              textAlign: TextAlign.center,
              maxLines: 10
            ),
            const SizedBox(height: 20,),
            Component.textDefault(
              "Copyright@2022 PintuPay \n All right reserved",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}