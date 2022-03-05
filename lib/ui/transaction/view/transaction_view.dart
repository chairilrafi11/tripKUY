import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/transaction/cubit/transaction_cubit.dart';
import 'package:pintupay/ui/transaction/model/response_transaction.dart';

class TransactionView extends StatelessWidget {

  TransactionView({ Key? key }) : super(key: key);

  final TransactionCubit transactionCubit = TransactionCubit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: Component.appBarLogo(),
        backgroundColor: PintuPayPalette.white,
        resizeToAvoidBottomInset: false,
        body: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
                child: Component.textBold("Transaksi", fontSize: PintuPayConstant.fontSizeLargeExtra, textAlign: TextAlign.start)
              ),
              const SizedBox(height: 10,),
              Container(
                padding: PintuPayConstant.paddingScreen,
                child: TextFormField(
                  decoration: Component.decorationNoBorder("Search")
                )
              ),
              const TabBar(
                labelColor: PintuPayPalette.darkBlue,
                indicatorColor: PintuPayPalette.darkBlue,
                unselectedLabelColor: PintuPayPalette.grey,
                tabs: [
                  Tab(text: "Sukses"),
                  Tab(text: "Proses"),
                  Tab(text: "Gagal"),
                ]
              ),
              Expanded(     
                child: BlocProvider(
                  create: (context) => transactionCubit..onGetTransactionList(),
                  child: BlocBuilder<TransactionCubit, TransactionState>(
                    builder: (context, state) {
                      if(state is TransactionLoading){
                        return const TabBarView(
                          children: [
                            ShimmerList(),
                            ShimmerList(),
                            ShimmerList(),
                          ]
                        );
                      } else if ( state is TransactionLoaded){
                        return TabBarView(
                          children: [
                            listTransaction(state.listTransaction),
                            listTransaction(state.listTransaction),
                            listTransaction(state.listTransaction),
                          ],
                        );
                      } else {
                        return TabBarView(
                          children: [
                            Container(),
                            Container(),
                            Container(),
                          ]
                        );
                      }
                    },
                  )
                ) 
              ,)
            ],
          ),
        ),
      ),
    );
  }

  Widget listTransaction(List<ResponseTransaction> listTransaction){
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal : PintuPayConstant.paddingHorizontalScreen),
      itemCount: listTransaction.length,
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
                      ViewUsecase.iconTransaction(listTransaction[index].transactionName ?? ""),
                      height: 20,
                    ),
                    const SizedBox(width: 10,),
                    Component.textBold(listTransaction[index].transactionName ?? ""),
                    const Spacer(),
                    Component.textDefault(listTransaction[index].createdAt.toString(), fontSize: 11)
                  ],
                ),
                Component.divider(),
                const SizedBox(height: 10,),
                Component.textBold(listTransaction[index].serialNumber ?? ""),
                const SizedBox(height: 10,),
                Component.textDefault(
                  listTransaction[index].messages ?? "",
                  maxLines: 5,
                  fontSize: PintuPayConstant.fontSizeSmall
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Component.textBold(
                      "Total",
                      fontSize: 13,
                      colors: PintuPayPalette.darkBlue
                    ),
                    const SizedBox(width: 10,),
                    Component.textBold(
                      CoreFunction.moneyFormatter(listTransaction[index].salePrice,),
                      fontSize: 13,
                      colors: PintuPayPalette.orange
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