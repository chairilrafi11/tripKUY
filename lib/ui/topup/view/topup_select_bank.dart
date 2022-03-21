import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/topup/cubit/topup_cubit.dart';
import 'package:pintupay/ui/topup/model/bank_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopupSelectbank extends StatelessWidget {

  const TopupSelectbank({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Topup"),
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child:  ListView(
          children: [
            const SizedBox(height: 20,),
            Component.textBold("Pilih Bank Transfer", fontSize: PintuPayConstant.fontSizeLargeExtra, textAlign: TextAlign.start),
            const SizedBox(height: 30,),
            BlocBuilder<TopupCubit, TopupState>(
              builder: (context, state) {
                if(state is TopupLoaded){
                  return listBank(state.listBank);
                } else if(state is TopupLoading){
                  return const ShimmerList();
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget listBank(List<BankResponse> list){
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => BlocProvider.of<TopupCubit>(context).navNominal(list[index]),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(10.0)
              ),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1
              )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: list[index].logo ?? "",
                  width: SizeConfig.blockSizeHorizontal * 15,
                  height: 50,
                ),
                const SizedBox(width: 10,),
                Component.textBold(list[index].name ?? "")
              ],
            ),
          ),
        );
      },
    );
  }
}