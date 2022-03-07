import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/about_app/view/about_app.dart';
import 'package:pintupay/ui/profile/bloc/profile_bloc.dart';

class ProfileMenuBloc {

  void navFeature(ProfileMenu profileMenu) {
    switch (profileMenu) {
      case ProfileMenu.info:
        routePush(const AboutApp(), RouterType.material);
        break;
      case ProfileMenu.termCondition:
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.cs:
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.rate:
        // TODO: Handle this case.
        break;
      case ProfileMenu.password:
        // TODO: Handle this case.
        break;
    }
  }
}