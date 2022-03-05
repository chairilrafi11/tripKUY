import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/forgot_password/view/forgot_password.dart';
import 'package:pintupay/ui/login/cubit/login_cubit.dart';
import 'package:pintupay/ui/login/model/login_model.dart';
import 'package:pintupay/ui/register/view/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/verification/view/check_phone_number.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String phoneNumber, password;
  bool isHiddenPassword = true;

  final LoginCubit loginCubit = LoginCubit();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void validate() {
    if (formKey.currentState!.validate()) {
      // LoginBloc().login(emailController.text, passwordController.text);
    }
    // routePush(SignUp(), RouterType.cupertino);
  }

  String? validatepass(value) {
    if (value!.isEmpty) {
      return "Password tidak boleh kosong";
    } else if (value.length < 6) {
      return "Minimal 6 Karakter";
    } else if (value.length > 15) {
      return "Maksimal 15 Karakter";
    } else {
      return null;
    }
  }

  void _tooglePasswordView() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: PintuPayPalette.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/header_login.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 5,
                        ),
                        Image.asset(
                          'assets/icons/pintupay_logo.png',
                          height: SizeConfig.blockSizeHorizontal * 20,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'PintuPay',
                          style: TextStyle(
                              fontFamily: PintuPayConstant.avenirRegular,
                              color: PintuPayPalette.darkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.screenHeight / 16),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 15,
                        ),
                        _textFieldPhoneNumber(),
                        const SizedBox(
                          height: 20,
                        ),
                        _textFieldPassword(),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            // onTap: _routeToForgotPassword,
                            onTap: () => routePush(
                                const ForgotPassword(), RouterType.cupertino),
                            child: GestureDetector(
                              child: Text(
                                'Lupa Kata Sandi?',
                                style: TextStyle(
                                    color: PintuPayPalette.yellow,
                                    fontSize: SizeConfig.screenHeight / 60),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: SizeConfig.screenHeight / 20,
                          width: SizeConfig.screenWidth,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: PintuPayPalette.darkBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {
                              loginCubit.onLogin(LoginModel(
                                  session: Session(
                                      email: _phoneNumberController.text,
                                      imei: "",
                                      deviceId: "",
                                      deviceRegisterId: "",
                                      latitude: "",
                                      longitude: "",
                                      password: _passwordController.text,
                                      phoneNumber: _phoneNumberController.text,
                                      radius: "",
                                      simImei: ""),
                                  version: "2.1.5"));
                            },
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.screenHeight / 60),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Component.textDefault('Belum punya akun?',
                                  colors: Colors.black),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () => routePush(
                                    const CheckPhoneNumberView(),
                                    RouterType.cupertino),
                                child: GestureDetector(
                                  child: Text(
                                    'Daftar',
                                    style: TextStyle(
                                        color: PintuPayPalette.yellow,
                                        fontSize: SizeConfig.screenHeight / 60),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldPhoneNumber() {
    return TextFormField(
      controller: _phoneNumberController,
      style: TextStyle(
          fontSize: SizeConfig.screenHeight / 60,
          color: PintuPayPalette.darkBlue),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      cursorColor: PintuPayPalette.darkBlue,
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.deny(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'masukkan nomor telepon';
        }
        if (value.length < 8) {
          return 'data tidak lengkap';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.phone, color: PintuPayPalette.darkBlue),
        ),
        hintText: '8xxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Phone number',
        fillColor: PintuPayPalette.darkBlue,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return TextFormField(
      controller: _passwordController,
      style: TextStyle(
          fontSize: SizeConfig.screenHeight / 60,
          color: PintuPayPalette.darkBlue),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: isHiddenPassword,
      cursorColor: PintuPayPalette.darkBlue,
      inputFormatters: [
        LengthLimitingTextInputFormatter(20),
        FilteringTextInputFormatter.deny(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'masukkan password';
        }
        if (value.length < 8) {
          return 'data tidak lengkap';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.lock, color: PintuPayPalette.darkBlue),
        ),
        suffixIcon: IconButton(
            icon: Icon(
              isHiddenPassword ? Icons.visibility : Icons.visibility_off,
              color: PintuPayPalette.darkBlue,
            ),
            onPressed: _tooglePasswordView),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Password',
        fillColor: PintuPayPalette.darkBlue,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
        ),
      ),
    );
  }
}
