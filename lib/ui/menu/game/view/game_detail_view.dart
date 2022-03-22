import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/menu/game/model/game_product_response.dart';

import '../../../component/shimmer.dart';
import '../cubit/game_detail_cubit.dart';

class GameDetailView extends StatelessWidget {

  GameDetailView({Key? key }) : super(key: key);

  final TextEditingController serverId = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<GameDetailCubit, GameDetailState>(
              builder: (context, state) {
                if (state is GameDetailLoading) {
                  return Padding(
                    padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 20),
                    child: const ShimmerPulsa(),
                  );
                } else if (state is GameDetailLoaded) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Component.appBar(
                        BlocProvider.of<GameDetailCubit>(context).gameProviderResponse.name ?? "", 
                        transparet: true
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: form(state.gameProductResponse.form ?? [])
                      ),
                      const SizedBox(height: 10,),
                      Flexible(child: listProduct(state.gameProductResponse)),

                    ],
                  );
                } else if (state is GameDetailEmpty) {
                    return Center(child: Component.textBold("Product Kosong"),);
                } else {
                  return Container();
                }
              },
            )
          ),
        ],
      ),
    ); 
  }

  Widget listProduct(GameProductResponse gameProductResponse) {
    var size = MediaQuery.of(navGK.currentContext!).size;
    const double itemHeight = 140;
    final double itemWidth = size.width / 1.8;
    return GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemCount: gameProductResponse.game!.length,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemBuilder: (BuildContext context, int index) { 
        return InkWell(
          onTap: () {
            // if(idController.text.isNotEmpty && serverId.text.isNotEmpty){
              BlocProvider.of<GameDetailCubit>(context).onInquiry(
                serverId.text,
                idController.text, 
                gameProductResponse.game![index]
              );
            // } else {
            //   CoreFunction.showToast("Harap masukan no pelanggan");
            // }
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
                    gameProductResponse.game![index].name ?? "", 
                    fontSize: PintuPayConstant.fontSizeLargeExtra,
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Component.textBold(
                        CoreFunction.moneyFormatter(gameProductResponse.game![index].salePrice),
                        fontSize: PintuPayConstant.fontSizeMedium,
                        colors: PintuPayPalette.orange,
                        textAlign: TextAlign.center
                      ),
                      // const SizedBox(width: 10,),
                      // Text(
                      //   CoreFunction.moneyFormatter(GameProductResponse.Game![index].priceMerchant),
                      //   style: const TextStyle(
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

  Widget form(List<FormData> form){
    return ListView.builder(
      itemCount: form.length,
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: TextFormField(
            controller: form[index].textEditingController,
            decoration: Component.inputDecoration(form[index].label ?? ""),
            maxLength: 20,
            keyboardType: textInputType(form[index].formType ?? ""),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Wajib diisi*";
              }
              return null;
            },
          ),
        );
      },
    );
  }

  TextInputType textInputType(String type){
    switch (type.toLowerCase()) {
      case "number":
        return TextInputType.number;
      case "text":
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }
}