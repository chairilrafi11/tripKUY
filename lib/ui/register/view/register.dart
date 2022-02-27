import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/core_variable.dart';
import 'package:benpay/core/util/date_text_formatter.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/login/view/login.dart';
import 'package:benpay/ui/register/view/syarat_dan_ketentuan.dart';
import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nav_router/nav_router.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController typeNumberIdController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController regenciesController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController villagesController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController domisiliController = TextEditingController();

  bool isCanChangePassword = false;
  bool isHiddenPassword = true;
  bool isHiddenPasswordConfirmation = true;

  late int? selectedRadioGender = 0;
  late int? selectedRadioAddress = 0;
  late int? selectedRadioMarriageStatus = 0;

  bool termsCondition = false;
  bool acceptMember = false;
  bool addressDomisili = false;

  @override
  void initState() {
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeTermCondition(value) {
    setState(() {
      // termsCondition = value;
    });
  }

  void changeAcceptMember(value) {
    setState(() {
      // acceptMember = value;
    });
  }

  void changeAddressDomisili(value) {
    setState(() {
      addressDomisili = value;
      if (value == true) {
        domisiliController.text = addressController.text;
      } else {
        domisiliController.text = "";
      }
    });
  }

  bool validateMother(String motherName) {
    switch (motherName.toLowerCase()) {
      case "mama":
      case "mamah":
      case "mamaa":
      case "mamaaa":
      case "mamih":
      case "ibu":
      case "tante":
      case "umi":
        return true;
      default:
        return false;
    }
  }

  ConnectivityResult result = ConnectivityResult.none;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: Component.appbarDefault(title: 'Daftar'),
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
                  Component.textBold("Pendaftaran Anggota",
                      colors: BenpayPalette.black,
                      fontSize: 15,
                      textAlign: TextAlign.start),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFieldUserName(),
                  const SizedBox(
                    height: 15,
                  ),
                  _textFieldBirthPlace(),
                  const SizedBox(
                    height: 15,
                  ),
                  _textFieldBirthDateNew(),
                  const SizedBox(
                    height: 20,
                  ),
                  Component.textBold("Jenis Kelamin",
                      colors: BenpayPalette.black,
                      fontSize: 15,
                      textAlign: TextAlign.start),
                  _radioGender(),
                  const SizedBox(
                    height: 20,
                  ),
                  Component.textBold("Status Pernikahan",
                      colors: BenpayPalette.black,
                      fontSize: 15,
                      textAlign: TextAlign.start),
                  _radioMarriageStatus(),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFieldTypeOrNumberId(),
                  const SizedBox(
                    height: 20,
                  ),
                  _texyFieldMotherName(),
                  const SizedBox(
                    height: 20,
                  ),
                  Component.textBold("Alamat Tinggal Terkini",
                      colors: BenpayPalette.black,
                      fontSize: 15,
                      textAlign: TextAlign.start),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFieldAddress(),
                  CheckboxListTile(
                    title: const Text(
                      "Sesuai dengan KTP",
                      style:
                      TextStyle(fontSize: 12, color: BenpayPalette.darkBlue),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: BenpayPalette.darkBlue,
                    value: addressDomisili,
                    onChanged: (value) => changeAddressDomisili(value),
                  ),
                  !addressDomisili
                      ? Column(
                    children: [
                      _textFieldDomisili(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                      : Container(),
                  _textFieldKodePos(),
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.all(5),
                    color: BenpayPalette.greenBackground,
                    child: const Text(
                      'Calon anggota wajib membaca syarat & ketentuan serta akad anggota terlebih dahulu. Pilih "Lihat" untuk membaca',
                      style: TextStyle(fontSize: 13, color: BenpayPalette.text),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        activeColor: BenpayPalette.darkBlue,
                        value: termsCondition,
                        // onChanged: (value) => changeTermCondition(value)
                        onChanged: (value) {},
                      ),
                      const Flexible(
                        child: Text(
                          "Setuju dengan syarat dan ketentuan",
                          style: TextStyle(
                              fontSize: 12, color: BenpayPalette.darkBlue),
                        ),
                      ),
                      _buttonLihatSyaratKetentuan(),
                    ],
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

  Widget _buttonLihatSyaratKetentuan() {
    return Card(
        margin: const EdgeInsets.only(right: 20.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: BenpayPalette.darkBlue,
        child: InkWell(
          onTap: () {
            routePush(const SyaratDanKetentuan(), RouterType.cupertino)
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
        ));
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

  Widget _textFieldBirthPlace() {
    return TextFormField(
        controller: birthPlaceController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(255),
          FilteringTextInputFormatter.allow(
              RegExp(r'([a-z A-Z])', caseSensitive: false),
              replacementString: ''),
        ],
        maxLength: 30,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Tempat Lahir"));
  }

  Widget _textFieldBirthDateNew() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            controller: birthDateController,
            keyboardType: TextInputType.number,
            inputFormatters: [DateTextFormatter()],
            textInputAction: TextInputAction.next,
            maxLength: 10,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Wajib diisi*";
              }
              if (value.length == 10) {
                var dob = DateFormat("dd/MM/yyyy").parse(value.toString());
                Duration dur = DateTime.now().difference(dob);
                int differenceInYears = (dur.inDays / 365).floor();
                if (differenceInYears < 17) {
                  return "Minimal 17 Tahun";
                }
              }
            },
            decoration: Component.inputDecoration("Tanggal Lahir",
                hintText: "dd/mm/yyyy",
                suffixIcon: IconButton(
                    onPressed: () {
                      onTapBirtDateOld();
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      color: BenpayPalette.darkBlue,
                    ))),
          ),
        ),
      ],
    );
  }

  Widget _textFieldTypeOrNumberId() {
    return TextFormField(
        controller: typeNumberIdController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        maxLength: 16,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("No KTP"));
  }

  Widget _texyFieldMotherName() {
    return TextFormField(
        controller: motherNameController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(255),
          FilteringTextInputFormatter.allow(
              RegExp(r'([a-z A-Z])', caseSensitive: false),
              replacementString: ''),
        ],
        maxLength: 30,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
          if (validateMother(value)) {
            return "Tidak boleh nama panggilan*";
          }
        },
        decoration: Component.inputDecoration("Ibu Kandung"));
  }

  Widget _textFieldAddress() {
    return TextFormField(
        controller: addressController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(255),
          FilteringTextInputFormatter.allow(
              RegExp(r'([a-z A-Z 0-9 .])', caseSensitive: false),
              replacementString: ''),
        ],
        maxLength: 100,
        maxLines: 3,
        minLines: 1,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Masukkan Alamat Sesuai KTP"));
  }

  Widget _textFieldDomisili() {
    return TextFormField(
        controller: domisiliController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(255),
          FilteringTextInputFormatter.allow(
              RegExp(r'([a-z A-Z 0-9 .])', caseSensitive: false),
              replacementString: ''),
        ],
        maxLength: 100,
        maxLines: 3,
        minLines: 1,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Masukkan Alamat Domisili"));
  }

  Widget _textFieldKodePos() {
    return TextFormField(
        controller: kodePosController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        // Only numbers can be entered
        maxLength: 5,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Masukkan Kode Pos"));
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
            activeColor: BenpayPalette.darkBlue,
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
            activeColor: BenpayPalette.darkBlue,
            title: const Text(
              "Perempuan",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _radioMarriageStatus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            value: 1,
            groupValue: selectedRadioMarriageStatus,
            onChanged: (val) {
              setState(() {
                selectedRadioMarriageStatus = val as int?;
              });
            },
            activeColor: BenpayPalette.darkBlue,
            title: const Text(
              "Belum Menikah",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        Flexible(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            value: 2,
            groupValue: selectedRadioMarriageStatus,
            onChanged: (val) {
              setState(() {
                selectedRadioMarriageStatus = val as int?;
              });
            },
            activeColor: BenpayPalette.darkBlue,
            title: const Text(
              "Menikah",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
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
            if (!EmailValidator.validate(value)) {
              return "Email tidak valid";
            }
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
