import 'package:benpay/ui/profile/model/profile_menu.dart';
import 'package:benpay/ui/profile/model/response_user.dart';
import 'package:flutter/material.dart';

enum ProfileMenu { RATE, TERSM_CONDITION, CUSTOMER_SERVICE, HOW_TO, ADDRESS }

class ProfileBloc {
  late ResponseUser responseUser;

  List<ProfileMenuModel> listMenu = [
    ProfileMenuModel(
        label: "Daftar Alamat",
        icons: Icons.location_city,
        profileMenu: ProfileMenu.ADDRESS),
    ProfileMenuModel(
        label: "Syarat dan Ketentuan",
        icons: Icons.raw_off,
        profileMenu: ProfileMenu.TERSM_CONDITION),
    ProfileMenuModel(
        label: "Customer Service",
        icons: Icons.room_service,
        profileMenu: ProfileMenu.CUSTOMER_SERVICE),
    ProfileMenuModel(
        label: "Cara Penggunaan",
        icons: Icons.how_to_vote,
        profileMenu: ProfileMenu.HOW_TO),
    ProfileMenuModel(
        label: "Beri Ulasan",
        icons: Icons.rate_review,
        profileMenu: ProfileMenu.RATE),
  ];
}
