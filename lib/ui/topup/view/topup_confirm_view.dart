import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:pintupay/ui/topup/model/bank_response.dart';
import 'package:pintupay/ui/topup/model/topup_request_response.dart';

class TopupConfirmView extends StatelessWidget {

  final BankResponse bankResponse;
  final TopupRequestResponse topupRequestResponse;

  TopupConfirmView({ 
    required this.bankResponse,
    required this.topupRequestResponse,
    Key? key 
  }) : super(key: key);

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
          mainAxisSize: MainAxisSize.min,
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
                          imageUrl: bankResponse.logo ?? "",
                          width: SizeConfig.blockSizeHorizontal * 15,
                          height: 50,
                        ),
                        const SizedBox(width: 10,),
                        Component.textBold(
                          bankResponse.bankName ?? "",
                          colors: PintuPayPalette.darkBlue,
                          fontSize: PintuPayConstant.fontSizeLarge
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Component.textDefault(
                      "Nomor Rekening",
                      colors: PintuPayPalette.greyText,
                      fontSize: PintuPayConstant.fontSizeMedium
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Component.textBold(
                          bankResponse.accountNumber ?? "",
                          colors: PintuPayPalette.darkBlue,
                          fontSize: PintuPayConstant.fontSizeLarge
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                              text: (bankResponse.accountNumber).toString()
                            )).then((value) {
                              CoreFunction.showToast(
                                "Nomor Rekening telah di salin",
                                backgroundColor: PintuPayPalette.darkBlue
                              );
                            });
                          },
                          child: Container(
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
                      bankResponse.name ?? "",
                      colors: PintuPayPalette.darkBlue,
                      fontSize: PintuPayConstant.fontSizeLarge
                    ),
                    const SizedBox(height: 5,),
                    Component.divider(), 
                    const SizedBox(height: 10,),
                    Component.textDefault(
                      "Total Topup",
                      colors: PintuPayPalette.greyText,
                      fontSize: PintuPayConstant.fontSizeMedium
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Component.textBold(
                          CoreFunction.moneyFormatter(topupRequestResponse.amount),
                          colors: PintuPayPalette.red,
                          fontSize: PintuPayConstant.fontSizeLarge
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            Clipboard.setData(ClipboardData(
                              text: (topupRequestResponse.amount).toString()
                            )).then((value) {
                              CoreFunction.showToast(
                                "Nominal transfer telah di salin",
                                backgroundColor: PintuPayPalette.darkBlue
                              );
                            });
                          },
                          child: Container(
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
                          ),
                        )
                      ],
                    ),
                   
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
            const Spacer(),
            Component.button(
              label: "Beranda", 
              onPressed: (){
                pushAndRemoveUntil(Dashboard(), RouterType.material);
              }
            )
          ],
        ),
      ),
    );
  }
}