import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/core_function.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/bill/model/bill_body_model.dart';
import 'package:pintupay/ui/bill/model/bill_status_model.dart';
import 'package:pintupay/ui/bill/view/bill_view.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

class PaymentView extends StatelessWidget {

  PaymentView({ Key? key }) : super(key: key);


  List<Set<String>> listInfomartion = [
    {"Produk", "BPJS"},
    {"Nama","Chairil Rafi Purnama"},
    {"Nomor Referal", "62376587326856"},
    {"Nomor Pelanggan", "0328497334"},
    {"Jumlah Bulan", "1 Bulan"},
    {"Total", "51.000"},
    {"Biaya Admin", "2.500"},
    {"Total Pembayaran", "55.000"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Pembayaran"),
      backgroundColor: PintuPayPalette.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
            child: ListView(
              children: [
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Image.asset( 
                      "assets/icons/icmn_bpjs.png",
                      height: 50,
                    ),
                    const SizedBox(width: 10,),
                    Component.textBold("BPJS")
                  ],
                ),
                Component.divider(),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                              colors: PintuPayPalette.darkBlue,
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
              ],
            ),
          ),
          Positioned(
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
                      Component.textBold("RP 20.000", colors: PintuPayPalette.orange)
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
                      BillStatusModel billStatusModel = BillStatusModel(
                        billBody: [
                          BillBodyModel('ID Transaksi :', "#${212147515345237546}"),
                          BillBodyModel('Id Pelanggan :', "123456874923" ),
                          BillBodyModel('Nominal :', CoreFunction.moneyFormatter(50000)),
                          BillBodyModel('Biaya Admin :', CoreFunction.moneyFormatter(2000)),
                          BillBodyModel('Keterangan :', "Gitu aja")
                        ],
                        createdAt: DateTime.now().toString(), 
                        status: "sukses"
                      );

                      routePush(
                        BillStatus(
                          billStatusModel
                        ), 
                        RouterType.material
                      );
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
          )
        ],
      ),
    );
  }
}