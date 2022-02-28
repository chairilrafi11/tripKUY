import 'package:benpay/ui/dashboard/view/dashboard.dart';
import 'package:benpay/ui/profile/bloc/profile_bloc.dart';
import 'package:nav_router/nav_router.dart';

class ProfileMenuBloc {
  void navFeature(ProfileMenu profileMenu) {
    switch (profileMenu) {
      case ProfileMenu.ADDRESS:
        routePush(Dashboard(), RouterType.cupertino);
        break;
      case ProfileMenu.HOW_TO:
        routePush(Dashboard(), RouterType.cupertino);
        break;
      case ProfileMenu.CUSTOMER_SERVICE:
        routePush(Dashboard(), RouterType.cupertino);
        break;
      case ProfileMenu.TERSM_CONDITION:
        routePush(Dashboard(), RouterType.cupertino);
        break;
      case ProfileMenu.RATE:
        routePush(Dashboard(), RouterType.cupertino);
        break;
    }
  }
}
