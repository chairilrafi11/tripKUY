import 'package:flutter/material.dart';
import '../model/profile_menu_model.dart';

enum ProfileMenu { RATE, TERSM_CONDITION, CUSTOMER_SERVICE, HOW_TO, ADDRESS }

class ProfileBloc {
  List<ProfileMenuModel> listMenu = [
    ProfileMenuModel(
        label: "Password & PIN",
        icons: Icons.password,
        profileMenu: ProfileMenu.ADDRESS),
    ProfileMenuModel(
        label: "Info PintuPay",
        icons: Icons.info,
        profileMenu: ProfileMenu.TERSM_CONDITION),
    ProfileMenuModel(
        label: "Contact Us",
        icons: Icons.credit_card,
        profileMenu: ProfileMenu.CUSTOMER_SERVICE),
    ProfileMenuModel(
        label: "Chat Customer Service",
        icons: Icons.headset_mic_rounded,
        profileMenu: ProfileMenu.HOW_TO),
  ];
}
