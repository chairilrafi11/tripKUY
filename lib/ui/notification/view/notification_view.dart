import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BenpayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BenpayConstant.paddingHorizontalScreen),
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/icons/logo.png",
                width: SizeConfig.blockSizeHorizontal * 40,
                // height: SizeConfig.blockSizeHorizontal * 10,
              ),
            ),
            const SizedBox(height: 20,),
            Component.textBold("Notifikasi", fontSize: BenpayConstant.fontSizeLargeExtra),
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
                              color: BenpayPalette.darkBlue,
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
                          fontSize: BenpayConstant.fontSizeMedium
                        ),
                        const SizedBox(height: 10,),
                        Component.textDefault(
                          "Topup sebesar 100.000 sedang di proses oleh admin, terimakasih sudah melakukan topup",
                          fontSize: BenpayConstant.fontSizeSmall
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