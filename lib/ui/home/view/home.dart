import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/balance/view/balance_view.dart';
import 'package:benpay/ui/banner/banner_advertise.dart';
import 'package:benpay/ui/banner/cubit/banner_cubit.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {

  Home({ Key? key }) : super(key: key);

  List<Set<String>> listMenu = [
    {"Bpjs", "assets/icons/icmn_bpjs.png"},
    {"E-Money", "assets/icons/icmn_emoney.png"},
    {"Hp Pascabayar", "assets/icons/icmn_hppascabayar.png"},
    {"Listrik", "assets/icons/icmn_listrik.png"},
    {"PDAM", "assets/icons/icmn_pdam.png"},
    {"Pulsa", "assets/icons/icmn_pulsa.png"},
    {"Telepon", "assets/icons/icmn_telepon.png"},
    {"Paket \n Data", "assets/icons/icmn_tiket_kereta.png"}
  ];

  final HomeCubit _homeCubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BenpayPalette.whiteBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BenpayConstant.paddingHorizontalScreen),
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/icons/logo.png",
                width: SizeConfig.blockSizeHorizontal * 40,
                // height: SizeConfig.blockSizeHorizontal * 10,
              ),
            ),
            const SizedBox(height: 10,),
            const BalanceNew(),
            const SizedBox(height: 10,),
            BlocProvider(
              create: (context) => BannerCubit('primary'),
              child: const BannerAdvertise(),
            ),
            const SizedBox(height: 20,),
            Component.textBold("Menu", colors: BenpayPalette.darkBlue),
            const SizedBox(height: 20,),
            menu(),
            const SizedBox(height: 10,),
            feeds(),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget menu(){
    return SizedBox(
      height: 230,
      width: SizeConfig.blockSizeHorizontal * 100,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listMenu.length,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (80 / 100),
        ),
        itemBuilder: (BuildContext context, int index) { 
          return InkWell(
            onTap: () => _homeCubit.onClickMenu(listMenu[index].first),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // const Icon(Icons.star, size: 50, color: BenpayPalette.darkBlue),
                Image.asset(
                  listMenu[index].last,
                  // height: SizeConfig.blockSizeHorizontal * 13,
                ),
                const SizedBox(height: 10,),
                Component.textBold(listMenu[index].first, textAlign: TextAlign.center)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget feeds(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Component.textBold("Recommended", colors: BenpayPalette.darkBlue),
        const SizedBox(height: 20,),
        SizedBox(
          height: 105,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.only(right: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.bottomLeft,
                  width: SizeConfig.blockSizeHorizontal * 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            listMenu[5].last,
                            height: 20,
                            // height: SizeConfig.blockSizeHorizontal * 13,
                          ),
                          const SizedBox(width: 10,),
                          Component.textBold("Pulsa Three", colors: BenpayPalette.darkBlue),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Component.textBold("AON 30GB", colors: BenpayPalette.grey),
                      const SizedBox(height: 5,),
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
                  )
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}