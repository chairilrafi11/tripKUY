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
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Component.header(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                        decoration: Component.decorationNoBorder("No Handpone"),
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
                  const TabBar(
                    labelColor: BenpayPalette.darkBlue,
                    indicatorColor: BenpayPalette.darkBlue,
                    unselectedLabelColor: BenpayPalette.grey,
                    tabs: [
                      Tab(text: "Pulsa",),
                      Tab(text: "Paket Data"),
                    ]
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        pulsa(),
                        dataPlan(),
                      ]
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ); 
  }

  Widget pulsa(){
    var size = MediaQuery.of(navGK.currentContext!).size;
    const double itemHeight = 120;
    final double itemWidth = size.width / 1.8;
    return GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20),
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
    );
  }

  Widget dataPlan(){
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                
                Component.textBold("AON 30GB", colors: BenpayPalette.darkBlue),
                const SizedBox(height: 10,),
                Component.textDefault(
                  "30GB Internet Unlimited* (01.00-17.00 di Semua Jaringan Tri Indonesia) selama 30 hari",
                  fontSize: BenpayConstant.fontSizeSmall
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Component.textBold(
                      "RP 30.000",
                      fontSize: 13,
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
        );
      },
    );
  }
}