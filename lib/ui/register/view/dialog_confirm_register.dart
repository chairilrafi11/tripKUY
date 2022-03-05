import 'package:flutter/material.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';

import '../../../core/util/size_config.dart';
import '../../component/component.dart';

class DialogConfirmRegister extends StatelessWidget {
  final Future<void> Function() onRegister;

  const DialogConfirmRegister({Key? key, required this.onRegister}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Dialog(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: SizeConfig.blockSizeHorizontal * 100,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: PintuPayPalette.darkBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Component.textBold("Konfirmasi",
                  fontSize: 20, colors: PintuPayPalette.white)),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 25),
                Component.textDefault(
                    "Apakah anda yakin dengan data yang telah di masukan?",
                    textAlign: TextAlign.center),
                const SizedBox(height: 25),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () =>
                          Navigator.of(context).pop(),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          width: SizeConfig.blockSizeHorizontal * 30,
                          color: PintuPayPalette.red,
                          alignment: Alignment.center,
                          child: const Text(
                            'Batal',
                            style: TextStyle(color: PintuPayPalette.white),
                          )),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        await onRegister();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        width: SizeConfig.blockSizeHorizontal * 30,
                        color: PintuPayPalette.darkBlue,
                        child: const Text(
                          'Ya',
                          style: TextStyle(color: PintuPayPalette.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}