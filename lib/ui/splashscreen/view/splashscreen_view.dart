import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/dashboard/view/dashboard.dart';
import 'package:benpay/ui/home/view/home.dart';
import 'package:benpay/ui/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({ Key? key }) : super(key: key);

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (){
      pushAndRemoveUntil(const Login());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icons/logo.png",
          // height: 100,
          width: SizeConfig.blockSizeHorizontal * 70,
          fit: BoxFit.fill,
          // width: SizeConfig.blockSizeHorizontal * 50,
        ),
      ),
    );
  }
}