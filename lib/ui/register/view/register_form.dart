import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/core_variable.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/login/view/login.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController domisiliController = TextEditingController();

  bool isCanChangePassword = false;
  bool isHiddenPassword = true;
  bool isHiddenPasswordConfirmation = true;

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
      appBar: AppBar(
          backgroundColor: BenpayPalette.darkBlue,
          automaticallyImplyLeading: true,
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            'Daftar',
            style: TextStyle(fontSize: 20),
          )),
      body: Container(
        decoration: const BoxDecoration(
          color: BenpayPalette.whiteBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: BenpayPalette.whiteBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  _iconLogo(),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFieldUserName(),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFieldStoreName(),
                  const SizedBox(
                    height: 20,
                  ),
                  _texyFieldPhoneNumber(),
                  const SizedBox(
                    height: 20,
                  ),
                  _texyFieldEmail(),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFieldPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFieldConfirmationPassword(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 10.0),
                  _buttonSend(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonSend() {
    return InkWell(
      onTap: () async {
        result = await Connectivity().checkConnectivity();
        if (result == ConnectivityResult.mobile) {
        } else if (result == ConnectivityResult.wifi) {
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tidak Terhubung Internet')));
        }
        routePush(const Login(), RouterType.cupertino);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin:
              const EdgeInsets.only(bottom: 30, top: 10, left: 10, right: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: BenpayPalette.darkBlue),
          child: Component.textBold("Registrasi",
              colors: BenpayPalette.white, fontSize: 17)),
    );
  }

  Widget _iconLogo() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Image.asset(
          'assets/icons/logo.png',
          height: SizeConfig.blockSizeHorizontal * 10,
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
        maxLength: 30,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Nama Lengkap"));
  }

  Widget _textFieldStoreName() {
    return TextFormField(
        controller: storeNameController,
        keyboardType: TextInputType.name,
        inputFormatters: [
          LengthLimitingTextInputFormatter(255),
          FilteringTextInputFormatter.allow(
              RegExp(r'([a-z A-Z])', caseSensitive: false),
              replacementString: ''),
        ],
        textInputAction: TextInputAction.next,
        maxLength: 30,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Nama Toko"));
  }

  Widget _texyFieldPhoneNumber() {
    return TextFormField(
        controller: phoneNumberController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        maxLength: 13,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Nomor HP"));
  }

  Widget _texyFieldEmail() {
    return TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(255),
          FilteringTextInputFormatter.allow(
              RegExp(r'([a-z A-Z 0-9 . @])', caseSensitive: false),
              replacementString: ''),
        ],
        maxLength: 30,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          } else {
            //? TODO
            // if (!EmailValidator.validate(value)) {
            //   return "Email tidak valid";
            // }
          }
        },
        decoration: Component.inputDecoration("Email"));
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
      style: const TextStyle(fontSize: 14, color: Colors.black),
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
      decoration: Component.inputDecoration(
        "Password",
        suffixIcon: IconButton(
            icon: Icon(
              isHiddenPassword ? Icons.visibility : Icons.visibility_off,
              color: BenpayPalette.darkBlue,
            ),
            onPressed: _tooglePasswordView),
      ),
    );
  }

  Widget _textFieldConfirmationPassword() {
    return TextFormField(
      controller: confirmPasswordController,
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.deny(
            RegExp(
                r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                caseSensitive: false),
            replacementString: ''),
      ],
      obscureText: isHiddenPasswordConfirmation,
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      maxLength: 20,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      validator: (value) {
        if (value == null) {
          isCanChangePassword = false;
          return 'Harap masukkan password baru 1x lagi';
        }
        if (value.length < 8) {
          isCanChangePassword = false;
          return CoreVariable.minlength8char;
        }
        if (value != passwordController.text) {
          isCanChangePassword = false;
          return 'Password tidak sama';
        }
        isCanChangePassword = true;
        return null;
      },
      decoration: Component.inputDecoration(
        "Konfirmasi Password",
        suffixIcon: IconButton(
            icon: Icon(
              isHiddenPasswordConfirmation
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: BenpayPalette.darkBlue,
            ),
            onPressed: _tooglePasswordConfirmationView),
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

  void _tooglePasswordConfirmationView() {
    if (isHiddenPasswordConfirmation) {
      isHiddenPasswordConfirmation = false;
    } else {
      isHiddenPasswordConfirmation = true;
    }

    setState(() {});
  }
}
