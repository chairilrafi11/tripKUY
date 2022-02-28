import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/topup/view/topup_input_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

class TopupSelectbank extends StatelessWidget {
  const TopupSelectbank({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Topup"),
      backgroundColor: BenpayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BenpayConstant.paddingHorizontalScreen),
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            Component.textBold("Pilih Bank Transfer", fontSize: BenpayConstant.fontSizeLargeExtra, textAlign: TextAlign.start),
            const SizedBox(height: 30,),
            ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => routePush(TopupInputView(), RouterType.material),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(10.0)
                      ),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1
                      )
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "https://1.bp.blogspot.com/-r636Aob_z_A/XicFI0zvA-I/AAAAAAAABe8/dIi1moSFZpMO7TFwhXAIEeaIpQhMCK9yACLcBGAsYHQ/s1600/Logo%2Bbank%2BBNI.png",
                          width: SizeConfig.blockSizeHorizontal * 15,
                          height: 50,
                        ),
                        const SizedBox(width: 10,),
                        Component.textBold("Bank Negara Indonesia")
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}