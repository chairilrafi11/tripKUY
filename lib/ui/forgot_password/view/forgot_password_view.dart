import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/core_variable.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../cubit/forgot_password_cubit.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

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
            key: _formKey,
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
                          color: PintuPayPalette.darkBlue,
                          size: SizeConfig.screenWidth * 0.07,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/logo.png',
                        height: SizeConfig.blockSizeHorizontal * 14,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 7,
                      ),
                      Component.textBold(
                          "Silahkan masukkan no telepon yang terdaftar",
                          colors: PintuPayPalette.darkBlue),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 7,
                      ),
                      TextFormField(
                        controller: phoneNumberController,
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight / 60,
                            color: PintuPayPalette.darkBlue),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
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
                            return 'Nomor telepon tidak lengkap';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(17.0),
                            child: Icon(Icons.phone,
                                color: PintuPayPalette.darkBlue),
                          ),
                          hintText: '8xxxxxxxx',
                          hintStyle: TextStyle(
                            color: PintuPayPalette.darkBlue,
                            fontSize: SizeConfig.screenHeight / 60,
                          ),
                          labelStyle:
                              const TextStyle(color: PintuPayPalette.darkBlue),
                          labelText: 'nomor telepon',
                          fillColor: PintuPayPalette.darkBlue,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: PintuPayPalette.darkBlue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: PintuPayPalette.darkBlue),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: PintuPayPalette.darkBlue),
                          ),
                        ),
                      ),
                      sendButton()
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

  Card sendButton() => Card(
        margin: const EdgeInsets.only(top: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        color: PintuPayPalette.darkBlue,
        child: InkWell(
          onTap: sendPhoneNumber,
          // onTap: () =>
          //     routePush(const ForgotPasswordForm(), RouterType.cupertino),
          // borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Container(
            alignment: Alignment.center,
            width: SizeConfig.screenWidth,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'Kirim',
              style: TextStyle(
                  color: PintuPayPalette.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  TextFormField phoneNumberInput() => TextFormField(
        controller: phoneNumberController,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: PintuPayPalette.darkBlue),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (value == null) {
            return 'Harap Masukkan Nomor Handphone';
          }
          if (value.length < 8) {
            return CoreVariable.minlength8char;
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
          labelText: 'nomor telepon',
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

  Future sendPhoneNumber() async {
    FocusScope.of(context).requestFocus(FocusNode());
    var form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      BlocProvider.of<ForgotPasswordCubit>(context).onRequestOTP(
        phoneNumberController.text,
      );
    }
  }
}
