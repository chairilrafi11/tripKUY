import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/menu/pulsa/cubit/pulsa_cubit.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class PulsaView extends StatelessWidget {

  PulsaView({ Key? key }) : super(key: key);

  final PulsaCubit pulsaCubit = PulsaCubit();

  TextEditingController phoneContactController = TextEditingController();

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
                        controller: phoneContactController,
                        decoration: Component.decorationNoBorder("No Handpone"),
                        onChanged: (value) {
                          CoreFunction.logPrint("Phone Number", value);
                          CoreFunction.debouncer.debounce(() {
                            pulsaCubit.onInquiry(value);
                          });
                        },
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
                    labelColor: PintuPayPalette.darkBlue,
                    indicatorColor: PintuPayPalette.darkBlue,
                    unselectedLabelColor: PintuPayPalette.grey,
                    tabs: [
                      Tab(text: "Pulsa",),
                      Tab(text: "Paket Data"),
                    ]
                  ),
                  Expanded(
                    child: BlocProvider(
                      create: (context) => pulsaCubit,
                      child: BlocBuilder<PulsaCubit, PulsaState>(
                        builder: (context, state) {
                          if(state is PulsaInitial) {
                            return TabBarView(
                              children: [
                                Container(),
                                Container(),
                              ]
                            );
                          } else if (state is PulsaLoaded){
                            return TabBarView(
                              children: [
                                pulsa(state.responsePulsa.pulsa!),
                                dataPlan(state.responsePulsa.data!),
                              ]
                            );
                          } else if (state is PulsaLoading) {
                            return TabBarView(
                              children: [
                                ShimmerPulsa(),
                                ShimmerPulsa(),
                              ]
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                    ) 
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ); 
  }

  Widget pulsa(List<Pulsa> listPulsa){
    var size = MediaQuery.of(navGK.currentContext!).size;
    const double itemHeight = 150;
    final double itemWidth = size.width / 1.8;
    return GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20),
      itemCount: listPulsa.length,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemBuilder: (BuildContext context, int index) { 
        return InkWell(
          onTap: () => pulsaCubit.confirm(listPulsa[index], phoneContactController.text),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Component.textBold(
                    listPulsa[index].name  ?? "", 
                    fontSize: PintuPayConstant.fontSizeLarge,
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Component.textBold(
                        CoreFunction.moneyFormatter(listPulsa[index].price), 
                        fontSize: PintuPayConstant.fontSizeLarge,
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
    );
  }

  Widget dataPlan(List<Data> listData){
    return ListView.builder(
      itemCount: listData.length,
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
                // Component.textBold(listData[index].name ?? "", colors: PintuPayPalette.darkBlue),
                const SizedBox(height: 10,),
                Component.textBold(
                  listData[index].name ?? "",
                  fontSize: PintuPayConstant.fontSizeMedium
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Component.textBold(
                      CoreFunction.moneyFormatter(listData[index].price),
                      fontSize: 13,
                      colors: PintuPayPalette.orange
                    ),
                    // const SizedBox(width: 10,),
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
        );
      },
    );
  }
}