import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopupConfirmView extends StatelessWidget {

  TopupConfirmView({ Key? key }) : super(key: key);

  final List<Set<String>> listProfile = [
    {"Bank", "Bank Negara Indonesia"},
    {"Nomor Rekening", "2210075324"},
    {"Nama Rekening", "Chairil Rafi Purnama"},
    // {"No KTP", "1234567890123456"},
  ];

  List<String> info = [
    "Pilih m-Transfer > Daftar Transfer > Antar Rekening",
    "Masukan No Rekening 2210075324 dan kirim",
    "Masuk Antar Rekening > pilih rekening a/n Chairil Rafi Purnama dengan no Rek 2210075324",
    "Isi jumlah uang dengan nominal yang sesuai",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Konfirmasi Topup"),
      resizeToAvoidBottomInset: false,
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Component.textBold("Informasi Rekening", fontSize: PintuPayConstant.fontSizeLargeExtra),
            const SizedBox(height: 20,),
            Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "https://1.bp.blogspot.com/-r636Aob_z_A/XicFI0zvA-I/AAAAAAAABe8/dIi1moSFZpMO7TFwhXAIEeaIpQhMCK9yACLcBGAsYHQ/s1600/Logo%2Bbank%2BBNI.png",
                          width: SizeConfig.blockSizeHorizontal * 15,
                          height: 50,
                        ),
                        const SizedBox(width: 10,),
                        Component.textBold(
                          "Bank Negara Indonesia",
                          colors: PintuPayPalette.darkBlue,
                          fontSize: PintuPayConstant.fontSizeLarge
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Component.textDefault(
                      "Nomor Rekening",
                      colors: PintuPayPalette.greyText,
                      fontSize: PintuPayConstant.fontSizeMedium
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Component.textBold(
                          "2210075324",
                          colors: PintuPayPalette.darkBlue,
                          fontSize: PintuPayConstant.fontSizeLarge
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: PintuPayPalette.orange,
                              width: 1
                            )
                          ),
                          child: Component.textDefault(
                            "Salin",
                            colors: PintuPayPalette.orange,
                            fontSize: PintuPayConstant.fontSizeSmall
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Component.divider(),
                    const SizedBox(height: 10,),
                    Component.textDefault(
                      "Nama Rekening",
                      colors: PintuPayPalette.greyText,
                      fontSize: PintuPayConstant.fontSizeMedium
                    ),
                    const SizedBox(height: 10,),
                    Component.textBold(
                      "Chairil Rafi Purnama",
                      colors: PintuPayPalette.darkBlue,
                      fontSize: PintuPayConstant.fontSizeLarge
                    ),
                    const SizedBox(height: 5,),
                    Component.divider()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Component.textBold("Petunjuk Transfer"),
            const SizedBox(height: 20,),
            Flexible(
              child: ListView.builder(
                itemCount: info.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Component.textDefault("${index + 1}. "),
                        const SizedBox(width: 5,),
                        Flexible(
                          child: Component.textDefault(
                            info[index], 
                            fontSize: PintuPayConstant.fontSizeMedium,
                            maxLines: 4
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}