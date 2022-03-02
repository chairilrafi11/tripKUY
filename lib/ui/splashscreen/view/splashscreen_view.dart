import 'package:benpay/core/benpay_palette.dart';
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
      backgroundColor: BenpayPalette.darkBlue,
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
              color: BenpayPalette.white,
              width: SizeConfig.blockSizeHorizontal * 70,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}