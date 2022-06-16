import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/component.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Padding(
        padding: Constant.paddingScreen,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 100, color: ColorPalette.grey,),
              SizedBox(height: SizeConfig.blockSizeVertical * 20,),
              Component.button(label: "Account Details", onPressed: (){}),
              const SizedBox(height: 10,),
              Component.button(label: "Logout", onPressed: (){}, color: ColorPalette.red)
            ],
          ),
        ),
      )
    );
  }
}