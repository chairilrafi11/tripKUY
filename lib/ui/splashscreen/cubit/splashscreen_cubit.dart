import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/database/box/user/user_box_controller.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/login/view/login.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  
  SplashscreenCubit() : super(SplashscreenInitial());

  Future checkSessions() async {
    CoreFunction.logPrint("Check", "Sessions");
    bool isLogin = await UserBoxController.isLogin();
    if(isLogin){
      var userBox = await UserBoxController.getUser();
      authUsecase.setUser(userBox!);
      pushAndRemoveUntil(Dashboard(), RouterType.material);
    } else {
      pushAndRemoveUntil(const Login(), RouterType.material);
    }
  }

}