import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';
import '../../../core/util/core_function.dart';
import '../../login/view/login.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future getProfile() async {
    await ProfileProvider.profile();
  }

  Future<void> onClickMenu(String key, bool isPin) async {
    CoreFunction.logPrint("onTapMenu", key);
    switch (key) {
      case "Password & Pin":
        routePush(const Login(), RouterType.cupertino);
        break;
      case "Info PintuPay":
        routePush(const Login(), RouterType.cupertino);
        break;
      case "PIN":
        if (isPin) {
          onChangePIN();
        } else {
          setPin();
        }
        break;
      case "Contact Us":
        routePush(const Login(), RouterType.cupertino);
        break;
      case "Chat Customer Service":
        routePush(const Login(), RouterType.cupertino);
        break;
      case "Logout":
        // String? fcm = await CoreFunction.generateFirebaseToken();
        // CoreFunction.logPrint("Fcm", fcm);
        break;
      default:
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

  Future<void> onChangePIN() async {
    await CoreFunction.showPin(null, label: getPinLabel()).then((pin) async {
      if ((pin?.isNotEmpty ?? false)) {
        if (oldPin == null) {
          oldPin = pin;
        } else if (oldPin != null && newPin == null) {
          newPin = pin;
        } else if (oldPin != null && newPin != null && confirmPin == null) {
          confirmPin = pin;
        }

        CoreFunction.logPrint(
            'PIN MODEL',
            jsonEncode({
              'old_pin': oldPin ?? '',
              'new_pin': newPin ?? '',
              'confirm_pin': confirmPin ?? '',
            }));

        if (confirmPin == null) {
          await ProfileProvider.checkPin({
            'old_pin': oldPin ?? '',
            'new_pin': newPin ?? '',
            'confirm_pin': confirmPin ?? '',
          }).then((value) {
            CoreFunction.logPrint('value returned catched', value.toString());
            onChangePIN();
          }, onError: (error, stackTrace) {
            if (newPin == null) {
              oldPin = null;
              CoreFunction.showToast('PIN Anda Salah');
            } else {
              newPin = null;
              CoreFunction.showToast(
                  'PIN Anda Tidak Boleh Sama Dengan PIN Sebelumnya');
            }
            CoreFunction.logPrint('Error returned catched', error.toString());
          });
        } else if (oldPin != null && newPin != null && confirmPin != null) {
          await ProfileProvider.updatePin({
            'old_pin': oldPin ?? '',
            'new_pin': newPin ?? '',
            'confirm_pin': confirmPin ?? '',
          }).then((value) {
            CoreFunction.showToast(
              'PIN Berhasil Di Ubah',
              backgroundColor: PintuPayPalette.darkBlue,
            );
            CoreFunction.logPrint('value returned catched', value.toString());
          }, onError: (error, stackTrace) {
            CoreFunction.showToast('PIN Gagal Di Ubah');
            CoreFunction.logPrint('Error returned catched', error.toString());
          });
          oldPin = null;
          newPin = null;
          confirmPin = null;
        }
      } else {
        oldPin = null;
        newPin = null;
        confirmPin = null;
      }
    });
  }

  Future setPin() async {
    // UserBox userBox = await ProfileProvider.profile(isLoading: true);
    // userBox.authToken = authUsecase.authToken!;
    // routePush(pin_create.PinCreate(userBox: userBox, verificationType: VerificationType.import));
    // emit(ProfileLoaded(userBox: userBox));
  }
}
