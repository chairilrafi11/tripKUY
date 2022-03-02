import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/topup/view/topup_confirm_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class TopupInputView extends StatelessWidget {

  TopupInputView({ Key? key }) : super(key: key);

  List<String> info = [
    "Pilih m-Transfer > Daftar Transfer > Antar Rekening",
    "Masukan No Rekening 2210075324 dan kirim",
    "Masuk Antar Rekening > pilih rekening a/n Chairil Rafi Purnama dengan no Rek 2210075324",
    "Isi jumlah uang dengan nominal yang sesuai",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: PintuPayPalette.white,
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [    
                Component.appBar("Topup", transparet: true),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Component.textBold("Masukan Nominal Topup", fontSize: PintuPayConstant.fontSizeLargeExtra),
                        const SizedBox(height: 30,),
                        TextFormField(
                          // controller: phoneContactController,
                          decoration: Component.inputDecoration("Nominal"),
                          maxLength: 16,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Wajib diisi*";
                            }
                          },
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const Icon(Icons.info, color: PintuPayPalette.darkBlue,),
                            const SizedBox(width: 10,),
                            Component.textDefault("Mininal nominal Topup adalah 50.000", fontSize: PintuPayConstant.fontSizeMedium)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Component.button(
                    label: "Lanjutkan",
                    onPressed: (){
                      routePush(TopupConfirmView(), RouterType.material);
                    }
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}