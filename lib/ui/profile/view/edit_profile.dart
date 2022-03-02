import 'dart:async';

import 'package:benpay/core/benpay_palette.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/pintupay/core_function.dart';
import '../../../core/util/size_config.dart';
import '../../component/component.dart';

class EditProfile extends StatefulWidget {

  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ConnectivityResult result = ConnectivityResult.none;
  String? selectedCommunity;
  StreamController<List<String>> streamCommunity = StreamController<List<String>>();

  Future<void> validate() async {
    var form = formKey.currentState;
    if (form!.validate()) {
      updateProfile();
    } else {
      CoreFunction.showToast("Data belum lengkap");
    }
  }

  @override
  void dispose() {
    streamCommunity.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setContent();
  }

  void setContent(){
    // userNameController.text = widget.profileInformation.name ?? '';
    // phoneNumberController.text = widget.profileInformation.phoneNumber ?? '';
    setState(() {});
  }

  Future<void> updateProfile() async{
    // return await profileDetailCubit.updateProfile(
    //     model: EditProfileModel(
    //         id: widget.profileInformation.id,
    //         name: userNameController.text,
    //         communityMember: selectedCommunity,
    //         email: emailController.text,
    //         gender: selectedRadioGender == 1 ? "Laki - Laki" : "Perempuan",
    //         idCardNumber: typeNumberIdController.text,
    //         phoneNumber: phoneNumberController.text,
    //         profession: professionController.text
    //     ),
    //     token: widget.profileInformation.token ?? ''
    // );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: Component.appBar('Ubah Profil'),
      body: Container(
        color: BenpayPalette.darkBlue,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              color: BenpayPalette.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)
              )
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                color: BenpayPalette.whiteBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                  child: formEdit()
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formEdit(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        _textFieldUserName(),
        const SizedBox(
          height: 20,
        ),
        _textFieldPhoneNumber(),
        const SizedBox(
          height: 20,
        ),
        _buttonSend(),
      ],
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
        style: const TextStyle(fontSize: 14, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Wajib diisi*";
          }
        },
        decoration: Component.inputDecoration("Nama Lengkap")
    );
  }

  Widget _textFieldPhoneNumber() {
    return TextFormField(
        controller: phoneNumberController,
        readOnly: true,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        maxLength: 20,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
        decoration: Component.inputDecoration("No Telepon")
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
        validate();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin:
          const EdgeInsets.only(bottom: 30, top: 10, left: 10, right: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: BenpayPalette.darkBlue),
          child: Component.textBold("Ubah Profil", colors: BenpayPalette.white, fontSize: 17)
      ),
    );
  }

}
