import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final List<Set<String>> listProfile = [
    {"Nama", "Chairil Rafi Purnama"},
    {"No Handphone", "08985722049"},
    {"Email", "chairilrafi11@gmail.com"},
    {"No KTP", "1234567890123456"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBarLogo(),
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.centerLeft,
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
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Component.textBold("Nama",
                                  colors: PintuPayPalette.white, fontSize: 16),
                              const Spacer(),
                              const Icon(Icons.edit,
                                  color: PintuPayPalette.white),
                              // IconButton(
                              //   onPressed: () {
                              //     routePush(const EditProfile(),
                              //         RouterType.cupertino);
                              //   },
                              //   icon: const Icon(Icons.edit),
                              //   color: PintuPayPalette.white,
                              // )
                            ],
                          ),
                        ],
                      ),
                      Component.textDefault("Chairil Rafi Purnama",
                          fontSize: 16, colors: PintuPayPalette.white),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Component.textBold("No. Handphone",
                                  colors: PintuPayPalette.white, fontSize: 16),
                              const Spacer(),
                              const Icon(Icons.qr_code,
                                  color: PintuPayPalette.white),
                            ],
                          ),
                        ],
                      ),
                      Component.textDefault('08985722049',
                          fontSize: 16, colors: PintuPayPalette.white),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Component.textBold('No. Handphone',
                                  colors: PintuPayPalette.white, fontSize: 16),
                              const Spacer(),
                              Component.textBold('Referral',
                                  fontSize: 12, colors: PintuPayPalette.white),
                            ],
                          ),
                        ],
                      ),
                      Component.textDefault('chairilrafi11@gmail.com',
                          fontSize: 16, colors: PintuPayPalette.white),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Component.textBold("Informasi Akun",
                fontSize: PintuPayConstant.fontSizeLargeExtra),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: listProfile.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.textDefault(listProfile[index].first,
                        colors: PintuPayPalette.greyText),
                    const SizedBox(
                      height: 10,
                    ),
                    Component.textBold(listProfile[index].last,
                        colors: PintuPayPalette.darkBlue,
                        fontSize: PintuPayConstant.fontSizeLarge),
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
