import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/util/util.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future onLogin() async {
    String? fcm = await CoreFunction.generateFirebaseToken();
    CoreFunction.logPrint("FCM", fcm.toString());
  }
}
