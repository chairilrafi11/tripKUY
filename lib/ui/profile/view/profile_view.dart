import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({ Key? key }) : super(key: key);

  final List<Set<String>> listProfile = [
    {"Nama", "Chairil Rafi Purnama"},
    {"No Handphone", "08985722049"},
    {"Email", "chairilrafi11@gmail.com"},
    {"No KTP", "1234567890123456"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BenpayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BenpayConstant.paddingHorizontalScreen),
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/icons/logo.png",
                width: SizeConfig.blockSizeHorizontal * 40,
                // height: SizeConfig.blockSizeHorizontal * 10,
              ),
            ),
            const SizedBox(height: 20,),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    "assets/images/card.png",
                    fit: BoxFit.fill,
                    height: SizeConfig.blockSizeHorizontal * 50,
                    width: SizeConfig.blockSizeHorizontal * 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.textDefault("Nomor Referal", colors: BenpayPalette.whiteBackground),
                    const SizedBox(height: 10,),
                    Component.textBold(
                      "1 2 3 4 5 6 7 8 9 0",
                      fontSize: 25,
                      colors: BenpayPalette.white
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Component.textBold("Informasi Akun", fontSize: BenpayConstant.fontSizeLargeExtra),
            const SizedBox(height: 20,),
            ListView.builder(
              itemCount: listProfile.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.textDefault(
                      listProfile[index].first,
                      colors: BenpayPalette.greyText
                    ),
                    const SizedBox(height: 10,),
                    Component.textBold(
                      listProfile[index].last,
                      colors: BenpayPalette.darkBlue,
                      fontSize: BenpayConstant.fontSizeLarge
                    ),
                    Component.divider()
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}