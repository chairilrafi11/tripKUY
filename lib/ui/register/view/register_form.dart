import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/core_variable.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/login/view/login.dart';
import 'package:benpay/ui/register/view/account_verification.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

import '../../dashboard/view/dashboard.dart';
import '../../forgot_password/view/forgot_password_form.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isCanChangePassword = false;
  bool isHiddenPassword = true;

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ConnectivityResult result = ConnectivityResult.none;

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
                          height: SizeConfig.blockSizeVertical * 15,
                        ),
                        Component.textDefault('Sign Up',
                            colors: BenpayPalette.darkBlue,
                            fontSize: 46,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 25,
                        ),
                        _textFieldUserName(),
                        const SizedBox(
                          height: 4,
                        ),
                        _textFieldPhoneNumber(),
                        const SizedBox(
                          height: 4,
                        ),
                        _textFieldPassword(),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: SizeConfig.screenHeight / 20,
                          width: SizeConfig.screenWidth / 1.35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: BenpayPalette.darkBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {
                              routePush(OTPVerification(), RouterType.cupertino);
                            },
                            child: Text(
                              'Daftar',
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
                              Component.textDefault('Sudah punya akun?',
                                  colors: Colors.black),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  result =
                                      await Connectivity().checkConnectivity();
                                  if (result == ConnectivityResult.mobile) {
                                  } else if (result ==
                                      ConnectivityResult.wifi) {
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Tidak Terhubung Internet')));
                                  }
                                  routePush(
                                      const Login(), RouterType.cupertino);
                                },
                                child: GestureDetector(
                                  child: Text(
                                    'Masuk',
                                    style: TextStyle(
                                        color: BenpayPalette.yellow,
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

  Widget _textFieldUserName() {
    return TextFormField(
      controller: userNameController,
      keyboardType: TextInputType.name,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.allow(
            RegExp(r'([a-z A-Z])', caseSensitive: false),
            replacementString: ''),
      ],
      textInputAction: TextInputAction.next,
      maxLength: 20,
      style: const TextStyle(fontSize: 14, color: BenpayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child:
              Icon(Icons.account_circle_rounded, color: BenpayPalette.darkBlue),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: BenpayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: BenpayPalette.darkBlue),
        labelText: 'Username',
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

  Widget _textFieldPhoneNumber() {
    return TextFormField(
      controller: phoneNumberController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      maxLength: 14,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
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
        labelText: 'Phone number',
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
      controller: passwordController,
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.deny(
            RegExp(
                r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                caseSensitive: false),
            replacementString: ''),
      ],
      obscureText: isHiddenPassword,
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      maxLength: 20,
      style: const TextStyle(fontSize: 14, color: BenpayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          isCanChangePassword = false;
          return 'Wajib diisi*';
        }
        if (value.length < 8) {
          isCanChangePassword = false;
          return CoreVariable.minlength8char;
        }
        isCanChangePassword = true;
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
        labelText: 'Password',
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

  void _tooglePasswordView() {
    if (isHiddenPassword) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
