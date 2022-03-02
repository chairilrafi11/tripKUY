import 'package:logging/logging.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/core_function.dart';
import 'package:pintupay/ui/splashscreen/view/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    runApp(const MyApp());
  // });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _setupLogging();
    super.initState();
  }

  void _setupLogging() async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      CoreFunction.logPrint("", '${rec.level.name}: ${rec.time}; ${rec.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PintuPay',
      navigatorKey: navGK,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: PintuPayConstant.avenirRegular
      ),
      home: const SplashscreenView(),
    );
  }
}