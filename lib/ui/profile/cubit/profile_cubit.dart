import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
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
          // onChangePIN();
        } else {
          // setPin();
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
}
