import 'package:benpay/ui/component/component_dialog.dart';
import 'package:benpay/ui/pin/view/pin_page.dart';
import 'package:flutter/material.dart';

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
}