import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/balance/view/balance_view.dart';
import 'package:benpay/ui/banner/banner_advertise.dart';
import 'package:benpay/ui/banner/cubit/banner_cubit.dart';
import 'package:benpay/ui/component/component.dart';
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
    {"Tiket \n Kereta", "assets/icons/icmn_tiket_kereta.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            Image.asset(
              "assets/icons/group.png",
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
          return Column(
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
        Container(
          height: 100,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.bottomLeft,
                color: BenpayPalette.green,
                width: SizeConfig.blockSizeHorizontal * 50,
                child: Component.textBold("Feeds", colors: BenpayPalette.white)
              );
            },
          ),
        ),
      ],
    );
  }
}