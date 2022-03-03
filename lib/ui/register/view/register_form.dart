import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/core_variable.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/login/view/login.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/register/cubit/register_cubit.dart';
import 'package:pintupay/ui/verification/model/register_form_model.dart';
import 'package:pintupay/ui/verification/model/response_check_phone_number.dart';

class Register extends StatefulWidget {

  final ResponseCheckPhoneNumber responseCheckPhoneNumber;

  const Register({required this.responseCheckPhoneNumber ,Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController agentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

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
      backgroundColor: PintuPayPalette.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/header_login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockSizeVertical * 15,
              ),
              Component.textDefault(
                'Sign Up',
                colors: PintuPayPalette.darkBlue,
                fontSize: 46,
                fontWeight: FontWeight.bold
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 10,
              ),
              _textFieldUserName(),
              const SizedBox(
                height: 4,
              ),
              _textFieldAgent(),
              const SizedBox(
                height: 4,
              ),
              _textFieldEmail(),
              const SizedBox(
                height: 4,
              ),
              _textFieldBirtDate(),
              const SizedBox(
                height: 4,
              ),
              _textFieldAddress(),
              const SizedBox(
                height: 4,
              ),
              _textFieldCity(),
              const SizedBox(
                height: 4,
              ),
              _textFieldGender(),
              const SizedBox(
                height: 4,
              ),
              _textFieldPassword(),
              const SizedBox(
                height: 4,
              ),
              _textFieldPasswordConfirm(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 50),
                height: SizeConfig.screenHeight / 20,
                width: SizeConfig.screenWidth / 1.35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: PintuPayPalette.darkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                  onPressed: () {
                    RegisterCubit().onRegisterForm(RegisterFormModel(
                      imei: "",
                      user: User(
                        address: addressController.text,
                        birthDate: "13-07-2001",
                        cityName: "Bandung",
                        birthPlace: "Bandung",
                        email: emailController.text,
                        gender: "L",
                        name: userNameController.text,
                        storeName: agentController.text,
                        parentReferral: "PEORANGAN",
                        password: passwordController.text,
                        passwordConfirmation: passwordController.text,
                        phoneNumber: widget.responseCheckPhoneNumber.phoneNumber,
                        id: widget.responseCheckPhoneNumber.id,
                        // areaId: 0,
                        // canTransactions: true,
                        // cashBalance: 0
                      ),
                      userLocation: UserLocation(
                        latitude: "",
                        longitude: ""
                      )
                    ));
                  },
                  child: Text(
                    'Daftar',
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
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child:
              Icon(Icons.account_circle_rounded, color: PintuPayPalette.darkBlue),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Nama Agen',
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

  Widget _textFieldAgent() {
    return TextFormField(
      controller: agentController,
      keyboardType: TextInputType.name,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.allow(
            RegExp(r'([a-z A-Z])', caseSensitive: false),
            replacementString: ''),
      ],
      textInputAction: TextInputAction.next,
      maxLength: 20,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child:
              Icon(Icons.account_circle_rounded, color: PintuPayPalette.darkBlue),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Nama Toko',
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

  Widget _textFieldEmail() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.name,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
      ],
      textInputAction: TextInputAction.next,
      maxLength: 40,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.email, color: PintuPayPalette.darkBlue),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Email',
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

  Widget _textFieldAddress() {
    return TextFormField(
      controller: addressController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      inputFormatters: <TextInputFormatter>[
      ],
      maxLength: 50,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.location_on, color: PintuPayPalette.darkBlue),
        ),
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Alamat',
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

  Widget _textFieldCity() {
    return TextFormField(
      controller: addressController,
      keyboardType: TextInputType.text,
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
          child: Icon(Icons.location_city, color: PintuPayPalette.darkBlue),
        ),
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Kota',
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
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
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

  Widget _textFieldPasswordConfirm() {
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
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
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
        labelText: 'Konfimasi Password',
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

  Widget _textFieldBirtDate() {
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
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      maxLength: 20,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
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
          child: Icon(Icons.date_range, color: PintuPayPalette.darkBlue),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Tanggal Lahir',
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

  Widget _textFieldGender() {
    return TextFormField(
      controller: genderController,
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.deny(
            RegExp(
                r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                caseSensitive: false),
            replacementString: ''),
      ],
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      maxLength: 1,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
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
          child: Icon(Icons.person, color: PintuPayPalette.darkBlue),
        ),
        hintText: 'L/P',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Jenis Kelamin',
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

  void _tooglePasswordView() {
    if (isHiddenPassword) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }

}
