import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class DataPlanView extends StatelessWidget {
  const DataPlanView({ Key? key }) : super(key: key);

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
                Component.appBar("Paket Data", transparet: true),
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
                Flexible(
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
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
                              Component.textBold("AON 30GB", colors: PintuPayPalette.darkBlue),
                              const SizedBox(height: 10,),
                              Component.textDefault(
                                "30GB Internet Unlimited* (01.00-17.00 di Semua Jaringan Tri Indonesia) selama 30 hari",
                                fontSize: PintuPayConstant.fontSizeSmall
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Component.textBold(
                                    "RP 30.000",
                                    fontSize: 13,
                                    colors: PintuPayPalette.orange
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "RP 35.000",
                                    style: TextStyle(
                                      color: PintuPayPalette.grey,
                                      fontFamily: PintuPayConstant.avenirRegular,
                                      fontSize: PintuPayConstant.fontSizeSmall,
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