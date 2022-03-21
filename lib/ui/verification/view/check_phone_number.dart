import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/verification/cubit/check_phone_number_cubit.dart';

class CheckPhoneNumberView extends StatelessWidget {

  final TextEditingController phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  CheckPhoneNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: PintuPayPalette.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/header_login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 25,
                ),
                Component.textDefault(
                  'Verifikasi No Handphone',
                  colors: PintuPayPalette.darkBlue,
                  fontSize: 30,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  fontWeight: FontWeight.bold
                ),
                const SizedBox(
                  height: 20,
                ),
                Component.textDefault(
                  'Masukan no telepon yang sudah terdaftar dengan Aplikasi Whatsapp',
                  colors: PintuPayPalette.blue1,
                  textAlign: TextAlign.center,
                  fontSize: PintuPayConstant.fontSizeLarge,
                  maxLines: 5,
                  fontWeight: FontWeight.bold
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 17,
                ),
                const SizedBox(
                  height: 4,
                ),
                _textFieldPhoneNumber(),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: SizeConfig.screenHeight / 20,
                  width: SizeConfig.screenWidth,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: PintuPayPalette.darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        // CoreFunction.logPrint("tag", "");
                        CheckPhoneNumberCubit().onCheckPhoneNumber(phoneNumberController.text);
                      }
                    },
                    child: Text(
                      'Kirim Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.screenHeight / 60
                      ),
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
        if (value.length < 10 ) {
          return "No handphone tidak sesuai";
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
        labelText: 'No Whatsapp',
        fillColor: PintuPayPalette.darkBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
        ),
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
