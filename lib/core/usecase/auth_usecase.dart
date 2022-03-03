import 'package:pintupay/ui/login/model/response_login.dart';

class AuthUsecase {

  late ResponseLogin responseLogin;

  setResponseLogin(value) => responseLogin = value;
}

AuthUsecase authUsecase = AuthUsecase();