import 'package:flutter/material.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';

import '../../core/util/core_variable.dart';
import '../../ui/component/component.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  late String password;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController conNewPasswordController = TextEditingController();

  bool isHiddenOldPassword = true;
  bool isHiddenNewPassword = true;
  bool isHiddenConNewPassword = true;
  bool isCanChangePassword = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Component.header(),
        ListView(
          children: [
            Component.appBar("Update Password", transparet: true),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Password Lama",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 50,
                        ),
                      ),
                    ),
                    _textFieldOldPassword(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Password Baru",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 50,
                        ),
                      ),
                    ),
                    _textFieldNewPassword(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Konfirmasi Password Baru",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 50,
                        ),
                      ),
                    ),
                    _textFieldConNewPassword(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildButtonNext(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildButtonReset(),
            ),
          ],
        ),
      ],
    ));
  }

  void _tooglePasswordView() {
    isHiddenOldPassword = !isHiddenOldPassword;
    setState(() {});
  }

  void _tooglePasswordViewNewPassword() {
    isHiddenNewPassword = !isHiddenNewPassword;
    setState(() {});
  }

  void _tooglePasswordViewConNewPassword() {
    isHiddenConNewPassword = !isHiddenConNewPassword;
    setState(() {});
  }

  Widget _textFieldOldPassword() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            controller: oldPasswordController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            obscureText: isHiddenOldPassword,
            maxLength: 20,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            validator: (value) {
              if (value == null) {
                isCanChangePassword = false;
                return 'Harap masukkan password lama';
              }
              if (value.length < 8) {
                isCanChangePassword = false;
                return CoreVariable.minlength8char;
              }
              isCanChangePassword = true;
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                counterText: "",
                suffixIcon: IconButton(
                    icon: Icon(
                      isHiddenOldPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: PintuPayPalette.darkBlue,
                    ),
                    onPressed: _tooglePasswordView),
                hintStyle: const TextStyle(fontSize: 11)),
          ),
        ));
  }

  Widget _textFieldNewPassword() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            controller: newPasswordController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            obscureText: isHiddenNewPassword,
            maxLength: 20,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            validator: (value) {
              if (value == null) {
                isCanChangePassword = false;
                return 'Harap masukkan password baru';
              }
              if (value.length < 8) {
                isCanChangePassword = false;
                return CoreVariable.minlength8char;
              }
              if (value == oldPasswordController.text) {
                isCanChangePassword = false;
                return 'Password baru tidak boleh sama dengan password lama';
              }
              isCanChangePassword = true;
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                counterText: "",
                suffixIcon: IconButton(
                    icon: Icon(
                      isHiddenNewPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: PintuPayPalette.darkBlue,
                    ),
                    onPressed: _tooglePasswordViewNewPassword),
                hintStyle: const TextStyle(fontSize: 11)),
          ),
        ));
  }

  Widget _textFieldConNewPassword() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            controller: conNewPasswordController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: isHiddenConNewPassword,
            maxLength: 20,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            validator: (value) {
              if (value == null) {
                isCanChangePassword = false;
                return 'Harap masukkan password baru 1x lagi';
              }
              if (value.length < 8) {
                isCanChangePassword = false;
                return CoreVariable.minlength8char;
              }
              if (value != newPasswordController.text) {
                isCanChangePassword = false;
                return 'Password baru tidak sama';
              }
              isCanChangePassword = true;
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                counterText: "",
                suffixIcon: IconButton(
                    icon: Icon(
                      isHiddenConNewPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: PintuPayPalette.darkBlue,
                    ),
                    onPressed: _tooglePasswordViewConNewPassword),
                hintStyle: const TextStyle(fontSize: 11)),
          ),
        ));
  }

  Widget _buildButtonNext() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: PintuPayPalette.darkBlue,
        elevation: 5.0,
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.75,
          MediaQuery.of(context).size.height * 0.05,
        ),
        alignment: FractionalOffset.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: checkInputPassword,
      child: Text(
        "Ubah",
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: MediaQuery.of(context).size.height / 48,
        ),
      ),
    );
  }

  Widget _buildButtonReset() {
    return TextButton(
      onPressed: () {
        // BlocProvider.of<UpdatePasswordCubit>(context).onResetPassword();
      },
      style: TextButton.styleFrom(
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.75,
          MediaQuery.of(context).size.height * 0.05,
        ),
        alignment: FractionalOffset.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Text(
        "Reset",
        style: TextStyle(
          color: PintuPayPalette.darkBlue,
          letterSpacing: 1.5,
          fontSize: MediaQuery.of(context).size.height / 48,
        ),
      ),
    );
  }

  checkInputPassword() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
    var form = formKey.currentState;
    if (form != null && form.validate()) {
      // changePassword();
      // BlocProvider.of<UpdatePasswordCubit>(context).onChangePassword(
      //   confirmPassword: conNewPasswordController.text,
      //   newPassword: newPasswordController.text,
      //   oldPassword: oldPasswordController.text,
      // );
    }
  }
}
