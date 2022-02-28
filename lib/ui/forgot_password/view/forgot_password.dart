import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/core_variable.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/forgot_password/view/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: BenpayPalette.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/icons/logo.png',
                    height: SizeConfig.blockSizeHorizontal * 16,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 7,
                  ),
                  Component.textBold("Silahkan masukkan no telepon yang terdaftar", colors: BenpayPalette.darkBlue),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 7,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    style: TextStyle(
                        fontSize: SizeConfig.screenHeight / 60,
                        color: BenpayPalette.white),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
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
                        borderSide:
                        const BorderSide(color: BenpayPalette.darkBlue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        const BorderSide(color: BenpayPalette.darkBlue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        const BorderSide(color: BenpayPalette.darkBlue),
                      ),
                    ),
                  ),
                  sendButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card sendButton() => Card(
    margin: const EdgeInsets.only(top: 20),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    color: BenpayPalette.darkBlue,
    child: InkWell(
      // onTap: sendPhoneNumber,
      onTap: () => routePush(const ForgotPasswordForm(), RouterType.cupertino),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        alignment: Alignment.center,
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Text(
          'Kirim',
          style: TextStyle(color: BenpayPalette.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );

  TextFormField phoneNumberInput() => TextFormField(
    controller: phoneNumberController,
    keyboardType: TextInputType.phone,
    textInputAction: TextInputAction.next,
    style: const TextStyle(color: BenpayPalette.darkBlue),
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
        borderSide:
        const BorderSide(color: BenpayPalette.darkBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:
        const BorderSide(color: BenpayPalette.darkBlue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:
        const BorderSide(color: BenpayPalette.darkBlue),
      ),
    ),
  );

  Future sendPhoneNumber() async {
    FocusScope.of(context).requestFocus(FocusNode());
    var form = _formKey.currentState;
    // if (form != null && form.validate()) {
    //   form.save();
    //   BlocProvider.of<ForgotPasswordCubit>(context).onRequestOTP(
    //     phoneNumberController.text,
    //   );
    // }
  }
}
