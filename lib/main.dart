import 'package:benpay/ui/splashscreen/view/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benpay',
      navigatorKey: navGK,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashscreenView(),
    );
  }
}