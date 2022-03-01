import 'package:another_flushbar/flushbar.dart';
import 'package:benpay/ui/component/component_dialog.dart';
import 'package:benpay/ui/pin/view/pin_page.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

import '../benpay_palette.dart';

class CoreFunction {
  
  static Future<String?> showPin(BuildContext? context, {String? label}) async {
    String? pin = "";
    await ComponentDialog().cupertinoDialog(builder: (BuildContext buildContext) {
      return PinPage(
        label: label,
      );
    }).then((dataPin) {
      pin = dataPin;
    });
    // CoreFunction.logPrint("Pin", pin);
    return pin;
  }

  static showToast(String message,
      {int duration = 3,
        int position = 1,
        Color backgroundColor = BenpayPalette.darkBlue}) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration: Duration(seconds: duration),
      backgroundColor: backgroundColor,
      icon: const Icon(Icons.error_outline, color: BenpayPalette.white),
      // message: message,
      messageText: Text(
        message,
        style: const TextStyle(
          color: BenpayPalette.white,
        ),
        maxLines: 3,
      ),
    ).show(navGK.currentContext!);
  }
}