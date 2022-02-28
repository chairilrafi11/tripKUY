import 'package:benpay/ui/profile/bloc/profile_bloc.dart';

class ProfileMenuModel {
  String? key;
  String? label;
  dynamic icons;
  ProfileMenu profileMenu;

  ProfileMenuModel({this.key, this.label, this.icons, required this.profileMenu});
}
