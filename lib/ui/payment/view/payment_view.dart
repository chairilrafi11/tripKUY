import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {

  final List<Set<String>> listInformation;
  final VoidCallback? paymentMethod;
  final Feature feature;

  const PaymentView({
    required this.listInformation, 
    required this.paymentMethod,
    required this.feature,
    Key? key 
  }) : super(key: key);

  Color isTotalValue(String key){
    if(key.toLowerCase().contains("total")){
      return PintuPayPalette.red;
    } else {
      return PintuPayPalette.darkBlue;
    }
  }

  bool isTotalKey(String key){
    if(key.toLowerCase().contains("total")){
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Pembayaran"),
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            Row(
              children: [
                Image.asset( 
                  ViewUsecase.iconFeature(feature),
                  height: 50,
                ),
                const SizedBox(width: 10,),
                Component.textBold(
                  ViewUsecase.nameFeature(feature)
                )
              ],
            ),
            Component.divider(),
            const SizedBox(height: 10,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listInformation.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 40,
                        child: isTotalKey(listInformation[index].first) 
                          ? Component.textBold(listInformation[index].first) 
                           :Component.textDefault(listInformation[index].first)
                      ),
                      const Spacer(),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 40,
                        child: Component.textBold(
                          listInformation[index].last, 
                          colors: isTotalValue(listInformation[index].first),
                          textAlign: TextAlign.start
                        )
                      ),
                    ],
                  ),
                );
              },
            ),
            // Container(
            //   height: 10,
            //   color: PintuPayPalette.whiteBackground,
            // ),
            // Padding(
            //   padding: PintuPayConstant.paddingScreen,
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Component.textDefault("Metode Pembayaran"),
            //       const Spacer(),
            //       Component.textDefault("Pilih"),
            //       Icon(Icons.arrow_forward_ios, size: 15)
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 10,
            //   color: PintuPayPalette.whiteBackground,
            // ),
            const Spacer(),
            buttonPayment(),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget buttonPaymentWithDesc(){
    return Positioned(
      bottom: 0.0,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          color: PintuPayPalette.white,
          border: Border(
            top: BorderSide(
              color: PintuPayPalette.whiteBackground,
              width: 1
            )
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Component.textBold("Total Pembayaran"),
                const SizedBox(height: 5,),
                Component.textBold(
                  listInformation.last.last, 
                  colors: PintuPayPalette.orange
                )
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PintuPayPalette.darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              onPressed: () {
                paymentMethod!();
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Bayar',
                  style: TextStyle(
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget buttonPayment(){
    return Component.button(
      label: "bayar", 
      onPressed:() {
        paymentMethod!();
      }
    );
  }
}