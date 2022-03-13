import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/about_app/view/about_app.dart';
import 'package:pintupay/ui/contact_us/view/contact_us.dart';
import 'package:pintupay/ui/profile/bloc/profile_bloc.dart';

import '../../../update_password/view/update_password.dart';
import '../../../update_pin/view/update_pin.dart';

class ProfileMenuBloc {

  void navFeature(ProfileMenu profileMenu) {
    switch (profileMenu) {
      case ProfileMenu.info:
        routePush(const AboutApp(), RouterType.material);
        break;
      case ProfileMenu.termCondition:
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.contactus:
        routePush(const ContactUs(), RouterType.cupertino);
        break;
      case ProfileMenu.cs:
        routePush(const ContactUs(), RouterType.cupertino);
        break;
      case ProfileMenu.password:
        routePush(const UpdatePassword(), RouterType.cupertino);
        break;
      case ProfileMenu.pin:
        routePush(const UpdatePin(), RouterType.cupertino);
        break;
    }
  }
}