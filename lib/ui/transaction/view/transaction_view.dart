import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: Component.appBarLogo(),
        backgroundColor: BenpayPalette.white,
        resizeToAvoidBottomInset: false,
        body: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: BenpayConstant.paddingHorizontalScreen),
                child: Component.textBold("Transaksi", fontSize: BenpayConstant.fontSizeLargeExtra, textAlign: TextAlign.start)
              ),
              const SizedBox(height: 10,),
              Container(
                padding: BenpayConstant.paddingScreen,
                child: TextFormField(
                  decoration: Component.decorationNoBorder("Search")
                )
              ),
              TabBar(
                labelColor: BenpayPalette.darkBlue,
                indicatorColor: BenpayPalette.darkBlue,
                unselectedLabelColor: BenpayPalette.grey,
                tabs: [
                  Tab(text: "Sukses"),
                  Tab(text: "Proses"),
                  Tab(text: "Gagal"),
                ]
              ),
              Expanded(     
                child: TabBarView(children: [
                  listTransaction(),
                  emptyTransaction(),
                  emptyTransaction()
                ]
              ),)
            ],
          ),
        ),
      ),
    );
  }

  Widget listTransaction(){
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal : BenpayConstant.paddingHorizontalScreen),
      itemCount: 10,
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
                    Image.asset( 
                      "assets/icons/icmn_bpjs.png",
                      height: 20,
                    ),
                    const SizedBox(width: 10,),
                    Component.textBold("BPJS"),
                    const Spacer(),
                    Component.textDefault("28 Februari 2022", fontSize: 11)
                  ],
                ),
                Component.divider(),
                const SizedBox(height: 10,),
                Component.textDefault(
                  "BPJS kesehatan 2 BULAN dengan nomor 00000024676328764632",
                  fontSize: BenpayConstant.fontSizeSmall
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Component.textBold(
                      "Total",
                      fontSize: 13,
                      colors: BenpayPalette.darkBlue
                    ),
                    const SizedBox(width: 10,),
                    Component.textBold(
                      "RP 130.000",
                      fontSize: 13,
                      colors: BenpayPalette.orange
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget emptyTransaction(){
    return Column(
      children: [
        SizedBox(height: SizeConfig.blockSizeHorizontal * 50,),
        Image.asset(
          "assets/images/empty_transaction.png",
          height: SizeConfig.blockSizeHorizontal * 50,
          width: SizeConfig.blockSizeHorizontal * 50,
        ),
        Component.textBold("Belum ada transaksi")
      ],
    );
  }
}