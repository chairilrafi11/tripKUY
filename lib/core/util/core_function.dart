import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nav_router/nav_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core_variable.dart';
import 'debouncer.dart';

class CoreFunction {
  static final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk

  static Debouncer debouncer = Debouncer(delay: const Duration(seconds: 1));

  static void logPrint(String tag, dynamic log) {
    if (CoreVariable.debug) {
      pattern
          .allMatches(tag + " => " + log.toString())
          .forEach((match) => debugPrint(match.group(0)));
    }
  }

  static String moneyFormatter(dynamic value) {
    double price = double.tryParse(value.toString()) ?? 0;
    var idr =
    NumberFormat.currency(locale: "id_ID", decimalDigits: 0, symbol: "Rp");
    return idr.format(price);
  }

  static Future<bool> checkConnectivity() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }

  static showToast(String message, {int duration = 3, int position = 1, Color backgroundColor = PintuPayPalette.red}) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration: Duration(seconds: duration),
      backgroundColor: backgroundColor,
      icon: const Icon(Icons.error_outline, color: PintuPayPalette.white),
      // message: message,
      messageText: Text(
        message,
        style: const TextStyle(
          color: PintuPayPalette.white,
        ),
        maxLines: 3,
      ),
    ).show(navGK.currentContext!);
  }

  static Future<String> showScanner(ScanMode scanMode) async => await FlutterBarcodeScanner.scanBarcode(
    "",
    "Batalkan",
    true,
    scanMode
  );

  static Future<void> navToAnotherApps({
    String? url,
    String? phoneNumber,
    String? email,
    bool? whatsApp = false,
    String? message = 'Hallo, saya mau bertanya.',
  }) async {
    if (phoneNumber != null && phoneNumber != '') {
      if (whatsApp!) {
        var whatsapp =
            "https://api.whatsapp.com/send/?phone=$phoneNumber&text=$message";
        if (await canLaunch(whatsapp)) {
          await launch(whatsapp);
        } else {
          showToast('whatsapp belum ter-install');
        }
      } else {
        if (await canLaunch('tel:$phoneNumber')) {
          await launch('tel:$phoneNumber');
        } else {
          showToast('Nomor Telepon tidak valid');
        }
      }
    } else if (email != null && email != '') {
      String mailTo =
          'mailto:$email?subject=e-Coop&body=${message?.replaceAll(' ', '%20')}';
      if (await canLaunch(mailTo)) {
        await launch(mailTo);
      } else {
        showToast('e-Mail tidak valid');
      }
    } else if (url != null && url != '') {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        showToast('URL tidak valid');
      }
    }
  }

  static Future<PermissionStatus> _getPermission(Permission permission) async {
    PermissionStatus permissionStatus = await permission.status;
    if (!permissionStatus.isGranted) {
      final status = await permission.request();
      permissionStatus = status;
    }
    if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    }
    return permissionStatus;
  }

  static String validatePhoneNumber(String phoneNumberUnvalidate) {
    String? phoneNumber;
    if (phoneNumberUnvalidate.substring(0, 2) == '08') {
      phoneNumber = phoneNumberUnvalidate;
    } else if (phoneNumberUnvalidate.substring(0, 2) == '62') {
      phoneNumber = '0${phoneNumberUnvalidate.substring(2)}';
    } else if (phoneNumberUnvalidate.substring(0, 3) == '+62') {
      phoneNumber = '0${phoneNumberUnvalidate.substring(3)}';
    } else if (phoneNumberUnvalidate.substring(0, 1) == '8') {
      phoneNumber = '0' + phoneNumberUnvalidate;
    } else {
      phoneNumber = '0' + phoneNumberUnvalidate;
    }

    return phoneNumber;
  }

  static String convertMonthToBahasa(String orderDate) {
    Map<String, String> map = Map.fromIterables(
      CoreVariable.codedMonth,
      CoreVariable.decodedMonth,
    );
    var newDate = map.entries
        .fold(orderDate, (String prev, e) => prev.replaceAll(e.key, e.value));
    return newDate;
  }

  static String constructTime(int seconds) {
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return twoDigitNumber(minute.toString()) + ":" + twoDigitNumber(second.toString());
  }

  static String twoDigitNumber(String twoDigit) {
    return twoDigit.toString().length == 1 ? "0" + twoDigit.toString() : twoDigit.toString();
  }

  static Future<String?> generateFirebaseToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (e) {
      CoreFunction.logPrint("Delete Firebase", e.toString());
    }
    var token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  static String version() {
    if (Platform.isAndroid) {
      return CoreVariable.appsVersionAndroid;
    } else if (Platform.isIOS) {
      return CoreVariable.appsversionIos;
    } else {
      return "";
    }
  }
}
