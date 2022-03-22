import 'package:flutter/material.dart';
import '../model/profile_menu_model.dart';

enum ProfileMenu { rate, termCondition, cs, password, info, contactus, pin }

class ProfileBloc {
  List<ProfileMenuModel> listMenu = [
    ProfileMenuModel(
      label: "Password",
      icons: Icons.key,
      profileMenu: ProfileMenu.password
    ),
    ProfileMenuModel(
        label: "Pin",
        icons: Icons.password,
        profileMenu: ProfileMenu.pin
    ),
    ProfileMenuModel(
      label: "Info PintuPay",
      icons: Icons.info,
      profileMenu: ProfileMenu.info
    ),
    ProfileMenuModel(
      label: "Contact Us",
      icons: Icons.credit_card,
      profileMenu: ProfileMenu.contactus
    ),
    ProfileMenuModel(
      label: "Chat Customer Service",
      icons: Icons.headset_mic_rounded,
      profileMenu: ProfileMenu.cs
    ),
  ];
}
