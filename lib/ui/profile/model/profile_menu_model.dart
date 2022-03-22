enum ProfileMenu { rate, termCondition, cs, password, info }

class ProfileMenuModel {
  String? key;
  String? label;
  dynamic icons;
  ProfileMenu profileMenu;

  ProfileMenuModel({this.key, this.label, this.icons, required this.profileMenu});
}
