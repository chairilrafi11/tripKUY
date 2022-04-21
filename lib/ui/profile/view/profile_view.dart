import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:pintupay/ui/profile/cubit/profile_cubit.dart';
import 'package:pintupay/ui/profile/model/profile_menu_model.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';

class ProfilePage extends StatelessWidget {

  ProfilePage({Key? key}) : super(key: key);

  final List<ProfileMenuModel> listMenu = [
    // ProfileMenuModel(
    //   label: "Password & PIN",
    //   icons: Icons.password,
    //   profileMenu: ProfileMenu.password
    // ),
    ProfileMenuModel(
      label: "Beri Rating",
      icons: Icons.thumb_up,
      profileMenu: ProfileMenu.rate
    ),
    ProfileMenuModel(
      label: "Chat Customer Service",
      icons: Icons.headset_mic_rounded,
      profileMenu: ProfileMenu.cs
    ),
    ProfileMenuModel(
      label: "Tentang Pintupay",
      icons: Icons.info,
      profileMenu: ProfileMenu.info
    ),
    ProfileMenuModel(
      label: "Syarat & Ketentuan",
      icons: Icons.task,
      profileMenu: ProfileMenu.termCondition
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBarLogo(),
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PintuPayConstant.paddingHorizontalScreen
        ),
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
                    CoreFunction.logPrint("FCM", authUsecase.userBox.fcmToken.toString());
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      "assets/images/card.png",
                      fit: BoxFit.fill,
                      height: SizeConfig.blockSizeHorizontal * 55,
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
                              const Icon(
                                Icons.edit,
                                color: PintuPayPalette.white
                              ),
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
                      Component.textDefault(
                        authUsecase.userBox.storeName ?? "",
                        fontSize: PintuPayConstant.fontSizeLargeExtra,
                        colors: PintuPayPalette.white
                      ),
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
                              const Icon(
                                Icons.qr_code,
                                color: PintuPayPalette.white
                              ),
                            ],
                          ),
                        ],
                      ),
                      Component.textDefault(
                        authUsecase.userBox.phoneNumber ?? "",
                        fontSize: PintuPayConstant.fontSizeLargeExtra,
                        colors: PintuPayPalette.white
                      ),
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
                              Component.textBold(
                                'Referral',
                                fontSize: 12, colors: PintuPayPalette.white
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 50,
                            child: Component.textDefault(
                              authUsecase.userBox.email ?? "",
                              fontSize: PintuPayConstant.fontSizeLargeExtra,
                              colors: PintuPayPalette.white
                            ),
                          ),
                          const Spacer(),
                          Component.textDefault(
                            authUsecase.userBox.referral ?? "",
                            fontSize: PintuPayConstant.fontSizeSmall,
                            colors: PintuPayPalette.white,
                          ),
                        ],
                      ),
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
              itemCount: listMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<ProfileCubit>(context).navMenu(listMenu[index].profileMenu);
                  },
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 2),
                    width: SizeConfig.safeBlockHorizontal * 100,
                    decoration: const BoxDecoration(
                      color: PintuPayPalette.white,
                      border: Border(
                        bottom: BorderSide(
                          color: PintuPayPalette.darkBlue,
                          width: 0.5
                        )
                      )
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          listMenu[index].icons,
                          color: PintuPayPalette.darkBlue,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          listMenu[index].label!,
                          style: const TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,
                            color: PintuPayPalette.darkBlue, size: 15)
                      ],
                    )
                  ),
                );
              }
            ),
            const SizedBox(
              height: 20,
            ),
            Component.button(
              label: "Keluar",
              color: PintuPayPalette.red,
              onPressed: () {
                CoreFunction.logout();
              }
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Component.textDefault(
                CoreFunction.version() + " (5)",
                fontSize: 13,
                colors: PintuPayPalette.greyText
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
