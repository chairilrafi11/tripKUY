import 'package:flutter/material.dart';

import '../../../core/util/size_config.dart';
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset('assets/icons/logo.png', height: SizeConfig.blockSizeVertical * 20,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Text(
              "Versi 1.0.0",
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height / 50,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 30, left: 10.0, right: 10.0),
              child: Text(
                "Aplikasi PintuPay merupakan aplikasi yang dikembangkan oleh Beben Alex, aplikasi ini bisa dijadikan alat transaksi PPOB",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 50,
                ),
                textAlign: TextAlign.center,
              )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              "Copyright@2022 PintuPay \n All right reserved",
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height / 50,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}