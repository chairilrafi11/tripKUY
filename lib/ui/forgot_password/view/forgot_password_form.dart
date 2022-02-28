import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/core_variable.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  List<bool> showPassword = [false, false];
  String? secretKey;

  _ForgotPasswordFormState();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: BenpayPalette.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0.0,
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                        top: SizeConfig.screenWidth * 0.1,
                        left: SizeConfig.screenWidth * 0.04),
                    width: SizeConfig.screenWidth,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: BenpayPalette.darkBlue,
                          size: SizeConfig.screenWidth * 0.07,
                        )),
                  ),
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/logo.png',
                          height: SizeConfig.blockSizeHorizontal * 16,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        _otpInput(),
                        const SizedBox(
                          height: 50,
                        ),
                        _passwordInput(),
                        const SizedBox(
                          height: 10,
                        ),
                        _passwordConfirmationInput(),
                        const SizedBox(
                          height: 10,
                        ),
                        _sendButton(),
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

  Card _sendButton() => Card(
        shape:
            RoundedRectangleBorder(borderRadius: CoreVariable.borderRadius50),
        color: BenpayPalette.darkBlue,
        child: InkWell(
          onTap: () {},
          borderRadius: CoreVariable.borderRadius50,
          child: Container(
            alignment: Alignment.center,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenWidth * 0.13,
            child: const Text(
              'Kirim',
              style: TextStyle(
                  color: BenpayPalette.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  TextFormField _passwordConfirmationInput() => TextFormField(
        controller: confirmNewPasswordController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: !showPassword[1],
        style: const TextStyle(color: BenpayPalette.darkBlue),
        inputFormatters: [
          LengthLimitingTextInputFormatter(16),
          FilteringTextInputFormatter.deny(
              RegExp(
                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  caseSensitive: false),
              replacementString: ''),
        ],
        validator: (value) {
          if (value == null) {
            return 'Harap Konfirmasi Password Anda';
          }
          if (value.length < 8) {
            return CoreVariable.minlength8char;
          }
          if (value != newPasswordController.text) {
            return 'Password tidak sama';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                showPassword[1] = !showPassword[1];
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  showPassword[1]
                      ? Icons.remove_red_eye_rounded
                      : Icons.remove_red_eye_outlined,
                  color: BenpayPalette.darkBlue,
                )
              ],
            ),
          ),
          labelText: 'Konfirmasi Password Baru',
          hintStyle: const TextStyle(color: BenpayPalette.grey),
          labelStyle: const TextStyle(color: BenpayPalette.darkBlue),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.darkBlue),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.darkBlue),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.grey),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.grey),
          ),
        ),
      );

  TextFormField _passwordInput() => TextFormField(
        controller: newPasswordController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: !showPassword[0],
        style: const TextStyle(color: BenpayPalette.darkBlue),
        inputFormatters: [
          LengthLimitingTextInputFormatter(16),
          FilteringTextInputFormatter.deny(
              RegExp(
                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  caseSensitive: false),
              replacementString: ''),
        ],
        validator: (value) {
          if (value == null) {
            return 'Harap Masukkan Password';
          }
          if (value.length < 8) {
            return CoreVariable.minlength8char;
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                showPassword[0] = !showPassword[0];
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  showPassword[0]
                      ? Icons.remove_red_eye_rounded
                      : Icons.remove_red_eye_outlined,
                  color: BenpayPalette.darkBlue,
                )
              ],
            ),
          ),
          labelText: 'Password',
          hintStyle: const TextStyle(color: BenpayPalette.grey),
          labelStyle: const TextStyle(color: BenpayPalette.darkBlue),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.darkBlue),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.darkBlue),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.grey),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.grey),
          ),
        ),
      );

  TextFormField _otpInput() => TextFormField(
        controller: otpController,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: BenpayPalette.darkBlue),
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.deny(
              RegExp(
                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  caseSensitive: false),
              replacementString: ''),
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (value == null) {
            return 'Harap masukkan OTP';
          }
          if (value.length < 8) {
            return 'Panjang Karakter Harus 8 Karakter';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'xxxx',
          labelText: 'OTP',
          hintStyle: TextStyle(color: BenpayPalette.grey),
          labelStyle: TextStyle(color: BenpayPalette.darkBlue),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.darkBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.darkBlue),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: BenpayPalette.grey),
          ),
        ),
      );
}
