import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';

import '../../core/util/size_config.dart';
import '../../ui/component/component.dart';
import '../../ui/pin/cubit/pin_cubit.dart';

class UpdatePin extends StatefulWidget {
  final String? label;

  const UpdatePin({Key? key, this.label}) : super(key: key);

  @override
  _UpdatePinState createState() => _UpdatePinState();
}

class _UpdatePinState extends State<UpdatePin> {
  final _formKey = GlobalKey<FormState>();
  PinCubit pinCubit = PinCubit();

  static Widget otpKeyboardInputButton(
      {String label = "",
      VoidCallback? onPressed,
      Color colors = PintuPayPalette.white}) {
    return Material(
      color: Colors.transparent,
      child: Card(
        color: colors,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: PintuPayPalette.darkBlue, width: 2),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(100.0),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenHeight * 0.1,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 30.0,
                  color: PintuPayPalette.darkBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Component.header(),
          ListView(
            children: [
              Component.appBar("Update Password", transparet: true),
              SizedBox(height: SizeConfig.blockSizeHorizontal * 15),
              if (widget.label != null)
                Component.textBold(widget.label!,
                    fontSize: 13, textAlign: TextAlign.center),
              BlocProvider(
                  create: (context) => pinCubit,
                  child: BlocBuilder<PinCubit, PinState>(
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _otpTextField(state.digitOne),
                              _otpTextField(state.digitTwo),
                              _otpTextField(state.digitThree),
                              _otpTextField(state.digitFour),
                              _otpTextField(state.digitFive),
                              _otpTextField(state.digitSix),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 0.1),
                child: Container(
                  padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.03,
                      bottom: SizeConfig.screenHeight * 0.02),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "1",
                                onPressed: () {
                                  pinCubit.inputDigit(1);
                                }),
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "2",
                                onPressed: () {
                                  pinCubit.inputDigit(2);
                                }),
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "3",
                                onPressed: () {
                                  pinCubit.inputDigit(3);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeHorizontal * 1)),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "4",
                                onPressed: () {
                                  pinCubit.inputDigit(4);
                                }),
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "5",
                                onPressed: () {
                                  pinCubit.inputDigit(5);
                                }),
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "6",
                                onPressed: () {
                                  pinCubit.inputDigit(6);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeHorizontal * 1)),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "7",
                                onPressed: () {
                                  pinCubit.inputDigit(7);
                                }),
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "8",
                                onPressed: () {
                                  pinCubit.inputDigit(8);
                                }),
                            otpKeyboardInputButton(
                                colors: Colors.white,
                                label: "9",
                                onPressed: () {
                                  pinCubit.inputDigit(9);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeHorizontal * 1)),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(navGK.currentContext!).pop(null),
                              child: const SizedBox(
                                width: 80.0,
                                child: Text(
                                  "Cancel",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: PintuPayPalette.orange,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            otpKeyboardInputButton(
                                colors: PintuPayPalette.white,
                                label: "0",
                                onPressed: () {
                                  pinCubit.inputDigit(0);
                                }),
                            InkWell(
                              onTap: pinCubit.deleteDigit,
                              borderRadius: BorderRadius.circular(40.0),
                              child: Container(
                                height: 80.0,
                                width: 80.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.backspace,
                                    color: PintuPayPalette.darkBlue,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _otpTextField(int? digit) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 12,
      padding: const EdgeInsets.all(5),
      height: SizeConfig.blockSizeHorizontal * 15,
      alignment: Alignment.center,
      child: digit == -1
          ? const Icon(
              Icons.lock,
              color: PintuPayPalette.darkBlue,
              size: 40,
            )
          : const Icon(
              Icons.lock_open,
              color: PintuPayPalette.darkBlue,
              size: 40,
            ),
    );
  }
}
