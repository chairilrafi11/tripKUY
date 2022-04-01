import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/menu/electric/cubit/electric_cubit.dart';

import '../../../../core/pintupay/pintupay.dart';
import '../../../../core/util/core_function.dart';
import '../model/electric_token_response.dart';

class ElectricView extends StatelessWidget {

  ElectricView({ Key? key }) : super(key: key);

  final TextEditingController idContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Component.appBar("Listrik", transparet: true),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                        labelColor: PintuPayPalette.white,
                        indicatorColor: PintuPayPalette.white,
                        unselectedLabelColor: PintuPayPalette.darkBlue,
                        indicator: BoxDecoration(
                          color: PintuPayPalette.darkBlue,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: PintuPayPalette.darkBlue, width: 1)
                        ),
                        tabs: const [
                          Tab(
                            text: "Token",
                          ),
                          Tab(
                            text: "Tagihan",
                          ),
                        ]
                      ),
                    ),
                  ),
                  BlocBuilder<ElectricCubit, ElectricState>(
                    builder: (context, state) {
                      if (state is ElectricLoading) {
                        return const Expanded(child: ShimmerPulsa());
                      } else if (state is ElectricLoaded) {
                        return Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Card(
                                    margin: const EdgeInsets.symmetric(vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Component.textBold("No. Pelanggan / No. Meter", textAlign: TextAlign.start),
                                          const SizedBox(height: 16,),
                                          Flexible(
                                            child: TextFormField(
                                              controller: idContactController,
                                              decoration: Component.decorationNoBorder("1234xxxxx"),
                                              maxLength: 16,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly,
                                              ],
                                              validator: (value) {
                                                if (value?.isEmpty ?? true) {
                                                  return "Wajib diisi*";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 20,),
                                          Component.notice("Transaksi Token PLN hanya dapat dilakukan pada waktu 00:30 WIB - 23:30 WIB sesuai kebijakan pihak PLN")
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  listToken(state.electricTokenResponse),
                                ],
                              ),
                              postpaid(context)
                            ]
                          ),
                        );
                      } else {
                        return Expanded(
                          child: TabBarView(
                            children: [
                              Center(child: Component.textBold("Tidak ada token")),
                              postpaid(context)
                            ]
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ); 
  }

  Widget listToken(ElectricTokenResponse electricTokenResponse){
    var size = MediaQuery.of(navGK.currentContext!).size;
    const double itemHeight = 120;
    final double itemWidth = size.width / 1.8;
    return Flexible(
      child: GridView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: electricTokenResponse.pulsaListrik!.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemBuilder: (BuildContext context, int index) { 
          return InkWell(
            onTap: () { 
              if (idContactController.text.isEmpty){
                CoreFunction.showToast("Masukan No pelanggan", backgroundColor: PintuPayPalette.red);
              } else {
                BlocProvider.of<ElectricCubit>(context).onPrepaidInquiry(idContactController.text, electricTokenResponse.pulsaListrik![index]);
              }
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Component.textBold(
                      electricTokenResponse.pulsaListrik![index].name ?? "", 
                      fontSize: PintuPayConstant.fontSizeLargeExtra
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Component.textBold(
                          CoreFunction.moneyFormatter(electricTokenResponse.pulsaListrik![index].salePrice),
                          fontSize: PintuPayConstant.fontSizeMedium,
                          colors: PintuPayPalette.orange
                        ),
                        const SizedBox(width: 10,),
                        // const Text(
                        //   "RP 35.000",
                        //   style: TextStyle(
                        //     color: PintuPayPalette.grey,
                        //     fontFamily: PintuPayConstant.avenirRegular,
                        //     fontSize: PintuPayConstant.fontSizeSmall,
                        //     overflow: TextOverflow.ellipsis,
                        //     decoration: TextDecoration.lineThrough
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget postpaid(context){
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Component.textBold("No. Pelanggan / No. Meter", textAlign: TextAlign.start),
            const SizedBox(height: 16,),
            Flexible(
              child: TextFormField(
                controller: idContactController,
                decoration: Component.decorationNoBorder("1234xxxxxxx"),
                maxLength: 16,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Wajib diisi*";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20,),
            Component.notice("Masukan No Pelanggan PLN dengan sesuai",),
            const SizedBox(height: 20,),
            Component.button(
              label: "Cek Tagihan",
              onPressed: (){
                BlocProvider.of<ElectricCubit>(context).onPostpaidInquiry(idContactController.text);
              }
            ),
          ],
        ),
      ),
    );
  }
}