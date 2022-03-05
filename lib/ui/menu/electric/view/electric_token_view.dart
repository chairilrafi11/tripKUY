import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/menu/electric/cubit/electric_cubit.dart';
import 'package:pintupay/ui/menu/electric/model/electric_token_response.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class ElectricToken extends StatelessWidget {
  ElectricToken({ Key? key }) : super(key: key);

  final ElectricCubit electricCubit = ElectricCubit() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Component.appBar("Listrik Token", transparet: true),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: TextFormField(
                      // controller: phoneContactController,
                      decoration: Component.inputDecoration("No pelanggan"),
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
                Component.textBold("Pilih Token"),
                const SizedBox(height: 10,),
                BlocProvider(
                  create: (context) => electricCubit..onGetToken(),
                  child: BlocBuilder<ElectricCubit, ElectricState>(
                    builder: (context, state) {
                      if (state is ElectricLoading) {
                        return const Flexible(child: ShimmerPulsa());
                      } else if (state is ElectricLoaded) {
                        return listToken(state.electricTokenResponse);
                      } else {
                        return Container();
                      }
                    },
                  )
                      )
              ],
            ),
          ),
        ],
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
            // onTap: () => routePush(PaymentView(), RouterType.material),
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

}