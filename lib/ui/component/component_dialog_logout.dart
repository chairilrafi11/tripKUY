import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

class ComponentDialogLogout {

  static logout() {
    return showDialog(
        context: navGK.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon(
                //   Icons.warning,
                //   size: 50,
                // ),
                // SizedBox(height: 20,),
                const Text(
                  "Konfirmasi keluar",
                  style: TextStyle(
                      color: BenpayPalette.darkBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Apakah kamu yakin akan keluar aplikasi?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          width: SizeConfig.blockSizeHorizontal * 30,
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: const Text(
                            "Batal",
                            style: TextStyle(color: BenpayPalette.white),
                          )),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // Component.dialogLoading();
                        // FireshipDatabase.deleteDatabase();
                        routePush(const Login(), RouterType.cupertino);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          width: SizeConfig.blockSizeHorizontal * 30,
                          color: BenpayPalette.darkBlue,
                          child: const Text(
                            "Ya",
                            style: TextStyle(color: BenpayPalette.white),
                          )),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
