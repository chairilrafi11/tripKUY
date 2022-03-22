import 'package:intl/intl.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/topup/model/bank_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/topup/view/topup_confirm_bsi.dart';
import 'package:pintupay/ui/topup/view/topup_confirm_transfer.dart';

import '../../../core/util/core_function.dart';

enum ListTopup { a, bsi, transferbank }

class TopupInputNew extends StatefulWidget {
  final BankResponse bankResponse;

  TopupInputNew({required this.bankResponse, Key? key}) : super(key: key);

  @override
  State<TopupInputNew> createState() => _TopupInputNewState();
}

class _TopupInputNewState extends State<TopupInputNew> {
  final TextEditingController nomController = TextEditingController();

  late int? selectedRadioListTopup = 0;

  ListTopup defaultValue = ListTopup.a;
  String topup = "";

  String _formatNumber(String s) => NumberFormat.decimalPattern('id')
      .format(int.parse(s.replaceAll('.', '').replaceAll(',', '')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: PintuPayPalette.white,
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PintuPayConstant.paddingHorizontalScreen),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Component.appBar("Topup", transparet: true),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Component.textBold("Jumlah Topup",
                            fontSize: PintuPayConstant.fontSizeLargeExtra),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: nomController,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              value = _formatNumber(value
                                  .replaceAll(',', '')
                                  .replaceAll('.', ''));
                              nomController.value = TextEditingValue(
                                text: value,
                                selection: TextSelection.collapsed(
                                    offset: value.length),
                              );
                            }
                          },
                          decoration: Component.inputDecoration("Nominal"),
                          maxLength: 7,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                          ],
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Wajib diisi*";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.info,
                              color: PintuPayPalette.darkBlue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Component.textDefault(
                                "Mininal nominal Topup adalah 50.000",
                                fontSize: PintuPayConstant.fontSizeMedium)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _radioListTopup(),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Component.button(
                      label: "Lanjutkan",
                      onPressed: () {
                        print(topup);
                        // if (topup == "bsi") {
                        //   routePush(
                        //       const TopupConfirmBSI(), RouterType.cupertino);
                        // } else if (topup == "transferbank") {
                        //   routePush(const TopupConfirmTransfer(),
                        //       RouterType.cupertino);
                        // } else {
                        //   CoreFunction.showToast(
                        //       "Pilih salah satu tujuan Topup");
                        // }
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _radioListTopup() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            value: ListTopup.bsi,
            groupValue: defaultValue,
            onChanged: (val) {
              setState(() {
                defaultValue = ListTopup.bsi;
                topup = "bsi";
                // selectedRadioListTopup = val as int?;
                // routePush(const TopupConfirmBSI(), RouterType.cupertino);
              });
            },
            activeColor: PintuPayPalette.darkBlue,
            title: const Text(
              "BSI",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        Flexible(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            value: ListTopup.transferbank,
            groupValue: defaultValue,
            onChanged: (val) {
              setState(() {
                // selectedRadioListTopup = val as int?;
                defaultValue = ListTopup.transferbank;
                topup = "transferbank";
              });
            },
            activeColor: PintuPayPalette.darkBlue,
            title: const Text(
              "Via Transfer Bank",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
