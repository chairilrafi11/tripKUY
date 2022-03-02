import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/home/view/home.dart';
import 'package:pintupay/ui/login/view/login.dart';
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
      backgroundColor: PintuPayPalette.darkBlue,
      body: Stack(
        children: [
          Container(
            height: SizeConfig.safeBlockVertical * 50,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/header_login.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/icons/logo.png",
              color: PintuPayPalette.white,
              width: SizeConfig.blockSizeHorizontal * 70,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}