import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/helpdesk/view/about_app.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/util/core_function.dart';
import '../../helpdesk/cubit/helpdesk_cubit.dart';
import '../../helpdesk/view/contact_us_view.dart';
import '../../terms_condition/view/terms_condition_view.dart';
import '../model/profile_menu_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future getProfile() async {
    await ProfileProvider.profile();
  }

  Future<void> navMenu(ProfileMenu profileMenu) async {
    switch (profileMenu) {
      case ProfileMenu.info:
        routePush(
          BlocProvider(
            create: (context) => HelpdeskCubit(),
            child: const AboutApp(),
          ),
          RouterType.material
        );
        break;
      case ProfileMenu.cs:
        routePush(
          BlocProvider(
            create: (context) => HelpdeskCubit(),
            child: const HelpdeskUsView(),
          ),
          RouterType.material
        );
        break;
      case ProfileMenu.rate:
        openAppStore();
        break;
      case ProfileMenu.password:
        // TODO: Handle this case
        break;
      case ProfileMenu.termCondition:
        routePush(const TermsConditionView(), RouterType.material);
        break;
    }
  }

  openAppStore() {
    try {
      launch("market://details?id=" "id.beben.pintupay");
    } on PlatformException catch (e) {
      CoreFunction.logPrint("Error", e.toString());
      launch(
          "https://play.google.com/store/apps/details?id=" "id.beben.pintupay");
    } finally {
      launch(
          "https://play.google.com/store/apps/details?id=" "id.beben.pintupay");
    }
  }
}
