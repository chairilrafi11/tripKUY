import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            Component.textBold("Notifikasi", fontSize: PintuPayConstant.fontSizeLargeExtra),
            const SizedBox(height: 10,),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.only(top: 5, bottom: index == 9 ? 100 : 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [                
                        Row(
                          children: [
                            // Image.asset( 
                            //   "assets/icons/icmn_bpjs.png",
                            //   height: 20,
                            // ),
                            Icon(
                              Icons.info,
                              size: 25,
                              color: PintuPayPalette.darkBlue,
                            ),
                            const SizedBox(width: 10,),
                            Component.textBold("Info"),
                            const Spacer(),
                            // Component.textDefault("28 Februari 2022", fontSize: 11)
                          ],
                        ),
                        Component.divider(),
                        const SizedBox(height: 10,),
                        Component.textBold(
                          "Topup",
                          fontSize: PintuPayConstant.fontSizeMedium
                        ),
                        const SizedBox(height: 10,),
                        Component.textDefault(
                          "Topup sebesar 100.000 sedang di proses oleh admin, terimakasih sudah melakukan topup",
                          fontSize: PintuPayConstant.fontSizeSmall
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}