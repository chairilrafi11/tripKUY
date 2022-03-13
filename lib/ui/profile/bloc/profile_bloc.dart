import 'package:flutter/material.dart';
import '../model/profile_menu_model.dart';

enum ProfileMenu { rate, termCondition, cs, password, info }

class ProfileBloc {
  List<ProfileMenuModel> listMenu = [
    ProfileMenuModel(
      label: "Password & PIN",
      icons: Icons.password,
      profileMenu: ProfileMenu.password
    ),
    ProfileMenuModel(
      label: "Info PintuPay",
      icons: Icons.info,
      profileMenu: ProfileMenu.info
    ),
    ProfileMenuModel(
      label: "Contact Us",
      icons: Icons.credit_card,
      profileMenu: ProfileMenu.cs
    ),
    ProfileMenuModel(
      label: "Chat Customer Service",
      icons: Icons.headset_mic_rounded,
      profileMenu: ProfileMenu.cs
    ),
  ];
}
