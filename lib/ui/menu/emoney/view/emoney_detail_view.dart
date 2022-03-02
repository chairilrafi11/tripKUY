import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class EmoneyDetailView extends StatelessWidget {
  const EmoneyDetailView({ Key? key }) : super(key: key);

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
            child: ListView(
              children: [
                Component.appBar("DANA", transparet: true),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: TextFormField(
                      // controller: phoneContactController,
                      decoration: Component.decorationNoBorder("Cari produk E-Money"),
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
                Component.textBold("Pilih Nominal"),
                const SizedBox(height: 10,),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  itemCount: 10,
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
                                "${index+1}0.000", 
                                fontSize: PintuPayConstant.fontSizeLargeExtra
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Component.textBold(
                                    "${index+1}1.500",
                                    fontSize: PintuPayConstant.fontSizeMedium,
                                    colors: PintuPayPalette.orange
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(
                                    "${index+1}2.000",
                                    style: const TextStyle(
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
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
}