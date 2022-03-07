import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';

import '../bloc/profile_bloc.dart';
import '../bloc/profile_menu_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ProfileBloc _profileBloc = ProfileBloc();
  final ProfileMenuBloc _profileMenuBloc = ProfileMenuBloc();

  // final List<Set<String>> listProfile = [
  //   {"Nama", "Chairil Rafi Purnama"},
  //   {"No Handphone", "08985722049"},
  //   {"Email", "chairilrafi11@gmail.com"},
  //   {"No KTP", "1234567890123456"},
  // ];

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
                InkWell(
                  onTap: () {
                    ProfileProvider.profile();
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      "assets/images/card.png",
                      fit: BoxFit.fill,
                      height: SizeConfig.blockSizeHorizontal * 50,
                      width: SizeConfig.blockSizeHorizontal * 100,
                    ),
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
                              Component.textBold(
                                "Nama",
                                colors: PintuPayPalette.white,
                                fontSize: PintuPayConstant.fontSizeMedium,
                              ),
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
                      Component.textDefault(authUsecase.userBox.name ?? "",
                          fontSize: PintuPayConstant.fontSizeLargeExtra,
                          colors: PintuPayPalette.white),
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
                              Component.textBold(
                                "No. Handphone",
                                colors: PintuPayPalette.white,
                                fontSize: PintuPayConstant.fontSizeMedium,
                              ),
                              const Spacer(),
                              const Icon(Icons.qr_code,
                                  color: PintuPayPalette.white),
                            ],
                          ),
                        ],
                      ),
                      Component.textDefault(
                          authUsecase.userBox.phoneNumber ?? "",
                          fontSize: PintuPayConstant.fontSizeLargeExtra,
                          colors: PintuPayPalette.white),
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
                              Component.textBold(
                                'Email',
                                colors: PintuPayPalette.white,
                                fontSize: PintuPayConstant.fontSizeMedium,
                              ),
                              const Spacer(),
                              Component.textBold('Referral',
                                  fontSize: 12, colors: PintuPayPalette.white),
                            ],
                          ),
                        ],
                      ),
                      Component.textDefault(authUsecase.userBox.email ?? "",
                          fontSize: PintuPayConstant.fontSizeLargeExtra,
                          colors: PintuPayPalette.white),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // ListView.builder(
            //   itemCount: listProfile.length,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Component.textDefault(listProfile[index].first,
            //             colors: PintuPayPalette.greyText),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         Component.textBold(listProfile[index].last,
            //             colors: PintuPayPalette.darkBlue,
            //             fontSize: PintuPayConstant.fontSizeLarge),
            //         Component.divider()
            //       ],
            //     );
            //   },
            // ),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 20),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _profileBloc.listMenu.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      _profileMenuBloc
                          .navFeature(_profileBloc.listMenu[index].profileMenu);
                    },
                    child: Container(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockVertical * 2),
                        width: SizeConfig.safeBlockHorizontal * 100,
                        decoration: const BoxDecoration(
                            color: PintuPayPalette.whiteBackground,
                            border: Border(
                                bottom: BorderSide(
                                    color: PintuPayPalette.darkBlue,
                                    width: 0.5))),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              _profileBloc.listMenu[index].icons,
                              color: PintuPayPalette.darkBlue,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _profileBloc.listMenu[index].label!,
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios,
                                color: PintuPayPalette.darkBlue, size: 15)
                          ],
                        )),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Component.button(
                label: "Keluar",
                color: PintuPayPalette.red,
                onPressed: () {
                  CoreFunction.logout();
                })
          ],
        ),
      ),
    );
  }
}
