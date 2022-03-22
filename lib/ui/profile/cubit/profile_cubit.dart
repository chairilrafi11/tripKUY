import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/database/box/user/user_box_controller.dart';
import 'package:pintupay/ui/about_app/view/about_app.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';
import '../../../core/util/core_function.dart';
import '../../login/view/login_view.dart';
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
        routePush(const AboutApp(), RouterType.material);
        break;
      case ProfileMenu.termCondition:
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.cs:
        var user = await UserBoxController.getUser();
        CoreFunction.logPrint("fcm", user?.fcmToken);
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

  String? oldPin;
  String? newPin;
  String? confirmPin;

  String getPinLabel() {
    if (oldPin == null) {
      return 'Masukkan PIN Lama';
    } else if (oldPin != null && newPin == null) {
      return 'Masukkan PIN Baru';
    } else if (oldPin != null && newPin != null && confirmPin == null) {
      return 'Konfirmasi PIN Baru';
    } else {
      return '';
    }
  }
}
