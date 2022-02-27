import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

List<Set<String>> listInfomartion = [
  {"Produk", "Pulsa Three 50.000"},
  {"Provider", "Three"},
  {"Nomor Handphone", "08985722049"},
  {"Harga", "51.000"}
];

class PaymentView extends StatelessWidget {
  const PaymentView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Pembayaran"),
      backgroundColor: BenpayPalette.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: BenpayConstant.paddingScreen,
                child: Row(
                  children: [
                    Image.asset( 
                      "assets/icons/icmn_pulsa.png",
                      height: 50,
                    ),
                    const SizedBox(width: 10,),
                    Component.textBold("Pulsa")
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: BenpayConstant.paddingScreen,
                itemCount: listInfomartion.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 40,
                          child: Component.textDefault(listInfomartion[index].first)
                        ),
                        const Spacer(),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 40,
                          child: Component.textBold(
                            listInfomartion[index].last, 
                            colors: BenpayPalette.darkBlue,
                            textAlign: TextAlign.start
                          )
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                height: 10,
                color: BenpayPalette.whiteBackground,
              ),
              Padding(
                padding: BenpayConstant.paddingScreen,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Component.textDefault("Metode Pembayaran"),
                    const Spacer(),
                    Component.textDefault("Pilih"),
                    Icon(Icons.arrow_forward_ios, size: 15)
                  ],
                ),
              ),
              Container(
                height: 10,
                color: BenpayPalette.whiteBackground,
              ),
            ],
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: BenpayPalette.white,
              width: SizeConfig.blockSizeHorizontal * 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Component.textBold("Total Pembayaran"),
                      const SizedBox(height: 5,),
                      Component.textBold("RP 20.000", colors: BenpayPalette.orange)
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: BenpayPalette.darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    onPressed: () {
                      
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
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
          )
        ],
      ),
    );
  }
}