import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/size_config.dart';
import 'package:pintupay/ui/balance/cubit/balance_cubit.dart';
import 'package:pintupay/ui/balance/view/balance_view.dart';
import 'package:pintupay/ui/banner/view/banner_advertise_view.dart';
import 'package:pintupay/ui/banner/cubit/banner_cubit.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {

  Home({Key? key}) : super(key: key);

  final List<Set<String>> listMenu = [
    {"Pulsa & Data", "assets/icons/icmn_pulsa.png"},
    {"Listrik", "assets/icons/icmn_listrik.png"},
    {"PDAM", "assets/icons/icmn_pdam.png"},
    {"Bpjs", "assets/icons/icmn_bpjs.png"},
    {"Hp Pascabayar", "assets/icons/icmn_hppascabayar.png"},
    {"Telepon", "assets/icons/icmn_telepon.png"},
    {"E-Money", "assets/icons/icmn_emoney.png"},
    {"Game", "assets/icons/icmn_game.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBarLogo(),
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: RefreshIndicator(
          onRefresh: () => BlocProvider.of<BalanceCubit>(context).onGetBalance(),
          child: ListView(
            children: [
              const SizedBox(height: 10,),
              const BalanceNew(),
              const SizedBox(height: 10,),
              BlocProvider(
                create: (context) => BannerCubit('primary'),
                child: const BannerAdvertiseView(),
              ),
              const SizedBox(height: 20,),
              Component.textBold("Menu", colors: PintuPayPalette.darkBlue),
              const SizedBox(height: 20,),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(state is HomeLoading){
                    return menu();
                    // return const ShimmerMenu();
                  } else if (state is HomeLoaded) {
                    return menu();
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 10,),
              // feeds(),
              const SizedBox(height: 20,),
            ],
          ),
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
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (120 / 100),
        ),
        itemBuilder: (BuildContext context, int index) { 
          return InkWell(
            onTap: () => BlocProvider.of<HomeCubit>(context).onClickMenu(listMenu[index].first),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Image.asset(
                    listMenu[index].last,
                  ),
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
        Component.textBold("Rekomendasi", colors: PintuPayPalette.darkBlue),
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
                color: PintuPayPalette.white,
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
                          Component.textBold("Pulsa Three", colors: PintuPayPalette.darkBlue),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Component.textBold("AON 30GB", colors: PintuPayPalette.darkBlue),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Component.textBold(
                            "RP 30.000",
                            fontSize: 13,
                            colors: PintuPayPalette.orange
                          ),
                          const SizedBox(width: 10,),
                          const Text(
                            "RP 35.000",
                            style: TextStyle(
                              color: PintuPayPalette.grey,
                              fontFamily: PintuPayConstant.avenirRegular,
                              fontSize: PintuPayConstant.fontSizeSmall,
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