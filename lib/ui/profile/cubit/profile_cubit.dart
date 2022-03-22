import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/ui/about_app/view/about_app.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/util/core_function.dart';
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
        routePush(const AboutApp(), RouterType.material);
        break;
      case ProfileMenu.cs:
        CoreFunction.showToast("Segera Datang", backgroundColor: PintuPayPalette.darkBlue);
        // var user = await UserBoxController.getUser();
        // CoreFunction.logPrint("fcm", user?.fcmToken);
        // routePush(const Login(), RouterType.cupertino);
        break;
      case ProfileMenu.rate:
        openAppStore();
        break;
      case ProfileMenu.password:
        // TODO: Handle this case
        break;
      case ProfileMenu.termCondition:
        routePush(TermsConditionView(), RouterType.material);
        break;
    }
  }


  openAppStore() {
    try {
      launch("market://details?id=" "id.beben.pintupay");
    } on PlatformException catch(e) {
      CoreFunction.logPrint("Error", e.toString());
      launch("https://play.google.com/store/apps/details?id=" "id.beben.pintupay");
    } finally {
      launch("https://play.google.com/store/apps/details?id=" "id.beben.pintupay");
    }
  }

  // String? oldPin;
  // String? newPin;
  // String? confirmPin;

  // String getPinLabel() {
  //   if (oldPin == null) {
  //     return 'Masukkan PIN Lama';
  //   } else if (oldPin != null && newPin == null) {
  //     return 'Masukkan PIN Baru';
  //   } else if (oldPin != null && newPin != null && confirmPin == null) {
  //     return 'Konfirmasi PIN Baru';
  //   } else {
  //     return '';
  //   }
  // }

  // Future<void> onChangePIN() async {
  //   await CoreFunction.showPin(null, label: getPinLabel()).then((pin) async {
  //     if ((pin?.isNotEmpty ?? false)) {
  //       if (oldPin == null) {
  //         oldPin = pin;
  //       } else if (oldPin != null && newPin == null) {
  //         newPin = pin;
  //       } else if (oldPin != null && newPin != null && confirmPin == null) {
  //         confirmPin = pin;
  //       }

  //       CoreFunction.logPrint(
  //           'PIN MODEL',
  //           jsonEncode({
  //             'old_pin': oldPin ?? '',
  //             'new_pin': newPin ?? '',
  //             'confirm_pin': confirmPin ?? '',
  //           }));

  //       if (confirmPin == null) {
  //         await ProfileProvider.checkPin({
  //           'old_pin': oldPin ?? '',
  //           'new_pin': newPin ?? '',
  //           'confirm_pin': confirmPin ?? '',
  //         }).then((value) {
  //           CoreFunction.logPrint('value returned catched', value.toString());
  //           onChangePIN();
  //         }, onError: (error, stackTrace) {
  //           if (newPin == null) {
  //             oldPin = null;
  //             CoreFunction.showToast('PIN Anda Salah');
  //           } else {
  //             newPin = null;
  //             CoreFunction.showToast(
  //                 'PIN Anda Tidak Boleh Sama Dengan PIN Sebelumnya');
  //           }
  //           CoreFunction.logPrint('Error returned catched', error.toString());
  //         });
  //       } else if (oldPin != null && newPin != null && confirmPin != null) {
  //         await ProfileProvider.updatePin({
  //           'old_pin': oldPin ?? '',
  //           'new_pin': newPin ?? '',
  //           'confirm_pin': confirmPin ?? '',
  //         }).then((value) {
  //           CoreFunction.showToast(
  //             'PIN Berhasil Di Ubah',
  //             backgroundColor: PintuPayPalette.darkBlue,
  //           );
  //           CoreFunction.logPrint('value returned catched', value.toString());
  //         }, onError: (error, stackTrace) {
  //           CoreFunction.showToast('PIN Gagal Di Ubah');
  //           CoreFunction.logPrint('Error returned catched', error.toString());
  //         });
  //         oldPin = null;
  //         newPin = null;
  //         confirmPin = null;
  //       }
  //     } else {
  //       oldPin = null;
  //       newPin = null;
  //       confirmPin = null;
  //     }
  //   });
  // }

  // Future setPin() async {
  //   // UserBox userBox = await ProfileProvider.profile(isLoading: true);
  //   // userBox.authToken = authUsecase.authToken!;
  //   // routePush(pin_create.PinCreate(userBox: userBox, verificationType: VerificationType.import));
  //   // emit(ProfileLoaded(userBox: userBox));
  // }
}
