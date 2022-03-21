import 'package:intl/intl.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/core/util/core_variable.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/register/cubit/register_cubit.dart';
import 'package:pintupay/ui/t&c/view/term_and_condition.dart';
import 'package:pintupay/ui/verification/model/register_form_model.dart';
import 'package:pintupay/ui/verification/model/response_check_phone_number.dart';

import '../../../core/util/core_function.dart';
import 'dialog_confirm_register.dart';

class Register extends StatefulWidget {
  final ResponseCheckPhoneNumber responseCheckPhoneNumber;

  const Register({required this.responseCheckPhoneNumber, Key? key})
      : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController uidNameController = TextEditingController();
  final TextEditingController agentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  bool isCanChangePassword = false;
  bool isHiddenPassword = true;
  bool isHiddenPasswordConfirmation = true;
  bool termsCondition = false;

  late int? selectedRadioGender = 0;

  RegisterCubit registerCubit = RegisterCubit();

  void changeTermCondition(value) {
    setState(() {
      termsCondition = value;
    });
  }

  @override
  void initState() {
    CoreFunction.logPrint("tag", widget.responseCheckPhoneNumber.toJson());
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ConnectivityResult result = ConnectivityResult.none;

  Future dialogConfirm() {
    return showDialog(
      context: navGK.currentContext!,
      barrierDismissible: true,
      builder: (BuildContext contextDialog) {
        return DialogConfirmRegister(onRegister: onRegister);
      }
    );
  }

  Future<void> validate() async {
    var form = formKey.currentState;
    if (form!.validate() && selectedRadioGender != 0) {
      if (termsCondition) {
        dialogConfirm();
      } else {
        CoreFunction.showToast("Checklist terlebih dahulu");
      }
    } else if (selectedRadioGender == 0) {
      CoreFunction.showToast("Pilih jenis kelamin");
    } else {
      CoreFunction.showToast("Data belum lengkap");
    }
  }

  Future<void> onRegister() async {
    CoreFunction.showPin(context).then((pin) async {
      if(pin != null){
        await RegisterCubit().onRegisterForm(RegisterFormModel(
          imei: "",
          user: User(
            pin: pin,
            uid: uidNameController.text,
            address: addressController.text,
            birthDate: birthDateController.text,
            fcm: await CoreFunction.generateFirebaseToken(),
            cityName: cityController.text,
            birthPlace: birthDateController.text,
            email: emailController.text,
            gender: selectedRadioGender == 1 ? "Laki - Laki" : "Perempuan",
            name: userNameController.text,
            storeName: agentController.text,
            parentReferral: "PEORANGAN",
            password: passwordController.text,
            typeId: 1,
            passwordConfirmation: confirmPasswordController.text,
            phoneNumber: widget.responseCheckPhoneNumber.phoneNumber,
            id: widget.responseCheckPhoneNumber.id,
          ),
          userLocation: UserLocation(latitude: "", longitude: "")
        ));
      }
    });
  }

  void onTapBirtDateOld() {
    DateTime dateNow = DateTime.now();
    int endYear = DateTime.now().year - 17;
    DateTime endDate = DateTime(endYear, dateNow.month, dateNow.day);
    showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(1960),
      lastDate: endDate,
      currentDate: endDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((date) {
      if (date is DateTime) {
        setState(() {
          birthDateController.text = DateFormat('dd/MM/yyyy').format(date);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: PintuPayPalette.white,
      resizeToAvoidBottomInset: false,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Container(
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
                  height: SizeConfig.blockSizeVertical * 10,
                ),
                Component.textDefault(
                  'Daftar',
                  colors: PintuPayPalette.darkBlue,
                  textAlign: TextAlign.center,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                const SizedBox(
                  height: 20,
                ),
                Component.textDefault(
                  'Isi form di bawah ini dengan sesuai',
                  colors: PintuPayPalette.blue1,
                  textAlign: TextAlign.center,
                  fontSize: PintuPayConstant.fontSizeLarge,
                  maxLines: 5,
                  fontWeight: FontWeight.bold
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
                _textFieldUserName(),
                const SizedBox(
                  height: 4,
                ),
                _textFieldAgent(),
                const SizedBox(
                  height: 4,
                ),
                _textFieldUid(),
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
                _radioGender(),
                const SizedBox(
                  height: 4,
                ),
                _textFieldPassword(),
                const SizedBox(
                  height: 4,
                ),
                _textFieldPasswordConfirm(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      activeColor: PintuPayPalette.darkBlue,
                      value: termsCondition,
                      // onChanged: (value) => changeTermCondition(value)
                      onChanged: (value) {},
                    ),
                    const Flexible(
                      child: Text(
                        "Setuju dengan syarat dan ketentuan",
                        style: TextStyle(
                            fontSize: 12, color: PintuPayPalette.darkBlue),
                      ),
                    ),
                    _buttonLihatSyaratKetentuan(),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 50),
                  height: SizeConfig.screenHeight / 20,
                  width: SizeConfig.screenWidth / 1.35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: PintuPayPalette.darkBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () {
                      validate();
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
      ),
    );
  }

  Widget _buttonLihatSyaratKetentuan() {
    return Card(
      margin: const EdgeInsets.only(right: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: PintuPayPalette.darkBlue,
      child: InkWell(
        onTap: () {
          routePush(const TermsAndCondition(), RouterType.cupertino)
              .then((value) {
            if (value != null) {
              changeTermCondition(true);
            }
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: SizeConfig.blockSizeHorizontal * 25,
          height: SizeConfig.blockSizeVertical * 3,
          child: const Text(
            "Lihat",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
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
          replacementString: ''
        ),
      ],
      textInputAction: TextInputAction.next,
      maxLength: 30,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(
            Icons.account_circle_rounded,
            color: PintuPayPalette.darkBlue
          ),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Nama Agen',
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

  Widget _textFieldAgent() {
    return TextFormField(
      controller: agentController,
      keyboardType: TextInputType.name,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.allow(
          RegExp(r'([a-z A-Z])', caseSensitive: false),
          replacementString: ''
        ),
      ],
      textInputAction: TextInputAction.next,
      maxLength: 20,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.account_circle_rounded,
              color: PintuPayPalette.darkBlue),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Nama Toko',
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

  Widget _textFieldUid() {
    return TextFormField(
      controller: uidNameController,
      keyboardType: TextInputType.name,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.digitsOnly
      ],
      textInputAction: TextInputAction.next,
      maxLength: 16,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(
            Icons.account_circle_rounded,
            color: PintuPayPalette.darkBlue
          ),
        ),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'No KTP',
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

  Widget _textFieldEmail() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.allow(
          RegExp(r'([a-z A-Z 0-9 . @])', caseSensitive: false),
          replacementString: ''
        ),
      ],
      textInputAction: TextInputAction.next,
      maxLength: 40,
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(17.0),
          child: Icon(Icons.email, color: PintuPayPalette.darkBlue),
        ),
        hintText: '...@..',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Email',
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

  Widget _textFieldAddress() {
    return TextFormField(
      controller: addressController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.allow(
            RegExp(r'([a-z A-Z 0-9 . @])', caseSensitive: false),
            replacementString: ''),
      ],
      maxLength: 50,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
        return null;
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

  Widget _textFieldCity() {
    return TextFormField(
      controller: cityController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        LengthLimitingTextInputFormatter(255),
        FilteringTextInputFormatter.allow(
            RegExp(r'([a-z A-Z 0-9 . @])', caseSensitive: false),
            replacementString: ''),
      ],
      maxLength: 14,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Wajib diisi*";
        }
        return null;
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

  Widget _textFieldPasswordConfirm() {
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
      style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
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
            onPressed: _tooglePasswordConfirmationView),
        hintText: 'xxxxxxxxx',
        hintStyle: TextStyle(
          color: PintuPayPalette.darkBlue,
          fontSize: SizeConfig.screenHeight / 60,
        ),
        labelStyle: const TextStyle(color: PintuPayPalette.darkBlue),
        labelText: 'Konfimasi Password',
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

  Widget _textFieldBirtDate() {
    return InkWell(
      onTap: (){
        onTapBirtDateOld();
      },
      child: TextFormField(
        controller: birthDateController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          LengthLimitingTextInputFormatter(255),
          FilteringTextInputFormatter.deny(
              RegExp(
                  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  caseSensitive: false),
              replacementString: ''),
        ],
        enabled: false,
        enableSuggestions: false,
        autocorrect: false,
        textInputAction: TextInputAction.next,
        maxLength: 20,
        style: const TextStyle(fontSize: 14, color: PintuPayPalette.darkBlue),
        validator: (value) {
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: PintuPayPalette.darkBlue),
          ),
          disabledBorder: OutlineInputBorder(
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
      ),
    );
  }

  Widget _radioGender() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            value: 1,
            groupValue: selectedRadioGender,
            onChanged: (val) {
              setState(() {
                selectedRadioGender = val as int?;
              });
            },
            activeColor: PintuPayPalette.darkBlue,
            title: const Text(
              "Laki-Laki",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        Flexible(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            value: 2,
            groupValue: selectedRadioGender,
            onChanged: (val) {
              setState(() {
                selectedRadioGender = val as int?;
              });
            },
            activeColor: PintuPayPalette.darkBlue,
            title: const Text(
              "Perempuan",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
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
