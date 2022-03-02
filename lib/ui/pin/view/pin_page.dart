import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/pin/cubit/pin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';

class PinPage extends StatefulWidget {

  final String? label;

  const PinPage({this.label, Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {

  final _formKey = GlobalKey<FormState>();
  PinCubit pinCubit = PinCubit();

  static Widget otpKeyboardInputButton({String label = "", VoidCallback? onPressed, Color colors = BenpayPalette.white}) {
    return Card(
      elevation: 0,
      color: BenpayPalette.whiteBackground,
      shape: RoundedRectangleBorder(
        // side: const BorderSide(color: BenpayPalette.darkBlue, width: 2),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100.0),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.1,
          width: SizeConfig.screenHeight * 0.1,
          child: Center(
            child: Component.textBold(
              label, 
              colors: BenpayPalette.darkBlue,
              fontSize: SizeConfig.blockSizeHorizontal * 10
            )
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("PIN"),
      backgroundColor: BenpayPalette.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: SizeConfig.blockSizeHorizontal * 15),
          Component.textBold(
            "Masukan Security Code Anda", 
            fontSize: BenpayConstant.fontSizeLargeExtra,
            colors: BenpayPalette.darkBlue, 
            textAlign: TextAlign.center, 
          ), 
          const SizedBox(height: 10,),
          BlocProvider(
            create: (context) => pinCubit,
            child: BlocBuilder<PinCubit, PinState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
            )
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeHorizontal * 0.1, 
              bottom: SizeConfig.blockSizeHorizontal * 10,
            ),
            child: Container(
              padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.03,
                bottom: SizeConfig.screenHeight * 0.02
              ),
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
                          }
                        ),
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "2",
                          onPressed: () {
                            pinCubit.inputDigit(2);
                          }
                        ),
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "3",
                          onPressed: () {
                            pinCubit.inputDigit(3);
                          }
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 1)),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "4",
                          onPressed: () {
                            pinCubit.inputDigit(4);
                          }
                        ),
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "5",
                          onPressed: () {
                            pinCubit.inputDigit(5);
                          }
                        ),
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "6",
                          onPressed: () {
                            pinCubit.inputDigit(6);
                          }
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 1)),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "7",
                          onPressed: () {
                            pinCubit.inputDigit(7);
                          }
                        ),
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "8",
                          onPressed: () {
                            pinCubit.inputDigit(8);
                          }
                        ),
                        otpKeyboardInputButton(
                          colors: Colors.white,
                          label: "9",
                          onPressed: () {
                            pinCubit.inputDigit(9);
                          }
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 1)),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(navGK.currentContext!).pop(null),
                          child: const SizedBox(
                            width: 80.0,
                            child: Text(
                              "Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: BenpayPalette.orange,
                                fontSize: 15
                              ),
                            ),
                          ),
                        ),
                        otpKeyboardInputButton(
                          colors: BenpayPalette.white,
                          label: "0",
                          onPressed: () {
                            pinCubit.inputDigit(0);
                          }
                        ),
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
                                color: BenpayPalette.darkBlue,
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
    );
  }

  Widget _otpTextField(int? digit) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: digit == -1
        ? const Icon(
            Icons.circle,
            color: BenpayPalette.blueLight,
            size: 30,
          )
        : const Icon(
            Icons.circle,
            color: BenpayPalette.darkBlue,
            size: 40,
          ),
    );
  }
}
