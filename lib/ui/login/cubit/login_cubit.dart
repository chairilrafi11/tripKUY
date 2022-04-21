import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/database/box/user/user_box.dart';
import 'package:pintupay/core/database/box/user/user_box_controller.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/login/model/login_model.dart';
import 'package:pintupay/ui/login/model/password_reset_request.dart';
import 'package:pintupay/ui/login/provider/login_provider.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future onLogin(LoginModel loginModel) async {
    String? fcm = await CoreFunction.generateFirebaseToken();
    CoreFunction.logPrint("FCM", fcm.toString());
    loginModel.session!.fcm = fcm;
    var login = PintuPayCrypt().encrypt(jsonEncode(loginModel), await PintuPayCrypt().getPassKeyPref());
    UserBox userBox = await LoginProvider.login(PostBody(login).toJson());

    //? Login sukses
    if(userBox.id != null) {
      userBox.fcmToken = fcm;
      await authUsecase.setUser(userBox);
      await UserBoxController.saveUser(userBox);
      pushAndRemoveUntil(Dashboard(), RouterType.material);
    }
  }
}
