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

  final TextEditingController searchController = TextEditingController();

  bottomSheetTransaction(ResponseTransaction responseTransaction) {
    showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))
      ),
      context: navGK.currentContext!,
      builder: (BuildContext buildContext) {
        var createdAt = DateTime.fromMillisecondsSinceEpoch(responseTransaction.createdAt! * 1000).toLocal();
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Component.textBold("No Order ${responseTransaction.serialNumber ?? "-"}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${ViewUsecase.twoDigitNumber(createdAt.day.toString())}-'
                        '${ViewUsecase.twoDigitNumber(createdAt.month.toString())}-'
                        '${createdAt.year} ${ViewUsecase.twoDigitNumber(createdAt.hour.toString())}:'
                        '${ViewUsecase.twoDigitNumber(createdAt.minute.toString())}'
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 63,
                        child: Component.textBold(
                          'No Pelanggan : ${responseTransaction.indentifierNumber.toString()}',
                          colors: Colors.black54)
                        ),
                      Component.textBold(
                          'Total Tagihan : ${responseTransaction.salePrice.toString()}',
                          colors: Colors.black54),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 60,
                        child: Component.textDefault(
                          responseTransaction.messages ?? "",
                            maxLines: 15
                          )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Component.textDefault(
                      //   '*${responseTransaction.statusDesc.toString()}',
                      //   colors: PintuPayPalette.red
                      // ),
                    ],
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ViewUsecase.iconTransaction(responseTransaction.transactionName!),
                          height: 40,
                        ),
                        const SizedBox(height: 10),
                        Component.textBold(
                          responseTransaction.transactionName!,
                          colors: PintuPayPalette.darkBlue,
                          textAlign: TextAlign.center
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Component.button(label: "Tutup", onPressed: (){
                Navigator.of(navGK.currentContext!).pop();
              })
            ],
          ),
        );
      }
    );
  }

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
                  // controller: searchController,
                  decoration: Component.decorationNoBorder("Search"),
                  onChanged: (value){
                    CoreFunction.debouncer.debounce(() {
                      CoreFunction.logPrint("value", value);
                      BlocProvider.of<TransactionCubit>(context).onSearch(value);
                    });
                  },
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
                          state.listTransactionSuccess.isNotEmpty ? listTransaction(state.listTransactionSuccess) : emptyTransaction(),
                          state.listTransactionPending.isNotEmpty ? listTransaction(state.listTransactionPending) : emptyTransaction(),
                          state.listTransactionFailed.isNotEmpty ? listTransaction(state.listTransactionFailed) : emptyTransaction(),
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
        return InkWell(
          onTap: () => bottomSheetTransaction(listTransaction[index]),
          child: Card(
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