import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/payment/view/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class PulsaView extends StatelessWidget {
  const PulsaView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const double itemHeight = 120;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Component.appBar("Pulsa", transparet: true),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: TextFormField(
                      // controller: phoneContactController,
                      decoration: Component.inputDecoration("No Handpone"),
                      maxLength: 16,
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
                  ),
                ),
                const SizedBox(height: 10,),
                Component.textBold("Pilih Nominal", textAlign: TextAlign.start),
                const SizedBox(height: 10,),
                Flexible(
                  child: GridView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (BuildContext context, int index) { 
                      return InkWell(
                        onTap: () => routePush(PaymentView(), RouterType.material),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Component.textBold(
                                  "$index.000", 
                                  fontSize: BenpayConstant.fontSizeLargeExtra
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Component.textBold(
                                      "RP 30.000",
                                      fontSize: BenpayConstant.fontSizeMedium,
                                      colors: BenpayPalette.orange
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text(
                                      "RP 35.000",
                                      style: TextStyle(
                                        color: BenpayPalette.grey,
                                        fontFamily: BenpayConstant.avenirRegular,
                                        fontSize: BenpayConstant.fontSizeSmall,
                                        overflow: TextOverflow.ellipsis,
                                        decoration: TextDecoration.lineThrough
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
}