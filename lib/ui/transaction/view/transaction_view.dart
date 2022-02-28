import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BenpayPalette.white,
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              padding: BenpayConstant.paddingScreen,
              child: Image.asset(
                "assets/icons/logo.png",
                width: SizeConfig.blockSizeHorizontal * 40,
                // height: SizeConfig.blockSizeHorizontal * 10,
              ),
            ),
            Container(
              padding: BenpayConstant.paddingScreen,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: BenpayPalette.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: BenpayPalette.white),
                  ),
                  counterText: "",
                  hintText: "Search",
                  contentPadding: const EdgeInsets.all(5),
                  // labelText: "Search",
                  // suffixIcon: suffixIcon,
                  hintStyle: const TextStyle(fontSize: 15.0)
                ),
              ),
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
                listTransaction(),
                listTransaction(),
              ]
            ),)
          ],
        ),
      ),
    );
  }

  Widget listTransaction(){
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal : BenpayConstant.paddingHorizontalScreen),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5),
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
                        "assets/icons/icmn_pulsa.png",
                        height: 20,
                      ),
                      const SizedBox(width: 10,),
                      Component.textBold("Pulsa"),
                      const Spacer(),
                      Component.textDefault("28 Februari 2022", fontSize: 11)
                    ],
                  ),
                  Component.divider(),
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
      ),
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