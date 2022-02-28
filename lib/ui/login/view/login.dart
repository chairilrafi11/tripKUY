import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/dashboard/view/dashboard.dart';
import 'package:benpay/ui/forgot_password/view/forgot_password.dart';
import 'package:benpay/ui/register/view/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String phoneNumber, password;

  bool isHiddenPassword = true;

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
      backgroundColor: BenpayPalette.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/logo.png',
                        height: SizeConfig.blockSizeHorizontal * 15,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 7,
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
                              'Lupa Password?',
                              style: TextStyle(
                                  color: BenpayPalette.yellow,
                                  fontSize: SizeConfig.screenHeight / 60),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: SizeConfig.screenHeight / 20,
                        width: SizeConfig.screenWidth / 0.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: BenpayPalette.darkBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          onPressed: () {
                            routePush(Dashboard(), RouterType.cupertino);
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
                            Component.textDefault('tidak punya akun?',
                                colors: Colors.black),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => routePush(
                                  const Register(), RouterType.cupertino),
                              child: GestureDetector(
                                child: Text(
                                  'Daftar',
                                  style: TextStyle(
                                      color: BenpayPalette.yellow,
                                      fontSize: SizeConfig.screenHeight / 60),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          child: Center(
                            child: Component.textDefault('Hubungi CS',
                                colors: BenpayPalette.yellow),
                          ),
                        ),
                      ),
                    ],
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
          color: BenpayPalette.darkBlue),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      cursorColor: BenpayPalette.darkBlue,
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
          child: Icon(Icons.phone, color: BenpayPalette.darkBlue),
        ),
        hintText: '8xxxxxxxx',
        hintStyle: TextStyle(
          color: BenpayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: BenpayPalette.darkBlue),
        labelText: 'nomor telepon',
        fillColor: BenpayPalette.darkBlue,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: BenpayPalette.darkBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: BenpayPalette.darkBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: BenpayPalette.darkBlue),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return TextFormField(
      controller: _passwordController,
      style: TextStyle(
          fontSize: SizeConfig.screenHeight / 60,
          color: BenpayPalette.darkBlue),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: isHiddenPassword,
      cursorColor: BenpayPalette.darkBlue,
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
          child: Icon(Icons.lock, color: BenpayPalette.darkBlue),
        ),
        suffixIcon: IconButton(
            icon: Icon(
              isHiddenPassword ? Icons.visibility : Icons.visibility_off,
              color: BenpayPalette.darkBlue,
            ),
            onPressed: _tooglePasswordView),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: BenpayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: BenpayPalette.darkBlue),
        labelText: 'password',
        fillColor: BenpayPalette.darkBlue,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: BenpayPalette.darkBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: BenpayPalette.darkBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: BenpayPalette.darkBlue),
        ),
      ),
    );
  }
}
