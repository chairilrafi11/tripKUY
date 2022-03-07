import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/profile/bloc/profile_bloc.dart';

import '../../login/view/login.dart';

class ProfileMenuBloc {
  void navFeature(ProfileMenu profileMenu) {
    switch (profileMenu) {
      case ProfileMenu.TERSM_CONDITION:
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.CUSTOMER_SERVICE:
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.HOW_TO:
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.ADDRESS:
        // routePush(const Login(), RouterType.cupertino);
        break;
    }
  }
}