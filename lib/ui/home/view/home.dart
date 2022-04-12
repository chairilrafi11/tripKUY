import 'package:fbroadcast_nullsafety/fbroadcast_nullsafety.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/balance/cubit/balance_cubit.dart';
import 'package:pintupay/ui/balance/view/balance_view.dart';
import 'package:pintupay/ui/banner/view/banner_advertise_view.dart';
import 'package:pintupay/ui/banner/cubit/banner_cubit.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/ui/home/model/recommended_response.dart';
import 'package:pintupay/ui/menu/pulsa/cubit/pulsa_cubit.dart';

import '../../menu/pulsa/model/response_pulsa.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Set<String>> listMenu = [
    {"Pulsa &\n Data", "assets/icons/icmn_pulsa.png"},
    {"Listrik", "assets/icons/icmn_listrik.png"},
    {"PDAM", "assets/icons/icmn_pdam.png"},
    {"Bpjs", "assets/icons/icmn_bpjs.png"},
    {"Hp Pascabayar", "assets/icons/icmn_hppascabayar.png"},
    {"Telepon", "assets/icons/icmn_telepon.png"},
    {"E-Money", "assets/icons/icmn_emoney.png"},
    // {"Game", "assets/icons/icmn_game.png"},
    // {"Tv & Internet", "assets/icons/icmn_game.png"}
  ];

  @override
  void initState() {
    super.initState();
    if(authUsecase.userBox.phoneNumber != "08985722049"){
      listMenu.add({"Game", "assets/icons/icmn_game.png"},);
    }
    FBroadcast.instance()!.register(CoreVariable.notificationBroadcast, (value, callback) {
      BlocProvider.of<BalanceCubit>(context).onGetBalance();
    });
  }

  @override
  void dispose() {
    FBroadcast.instance()!.dispose();
    super.dispose();
  }

  void bottomsheetRecommended(Pulsa pulsa) {
    TextEditingController idController = TextEditingController();
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))
      ),
      context: navGK.currentContext!, 
      builder: (BuildContext context) { 
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Component.textBold("Masukan No Telepon",),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: idController,
                  decoration: Component.inputDecoration("Masukan No Telepon")
                ),
                const SizedBox(height: 20,),
                Component.button(
                  label: "Lanjutkan", 
                  onPressed: (){
                    if (idController.text.isNotEmpty){
                      Navigator.of(context).pop();
                      PulsaCubit().confirm(pulsa , idController.text);
                    } else {
                      CoreFunction.showToast("Masukan No HP");
                    }
                  }
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        );
      }, 
    );
  }

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
                      return const ShimmerMenu();
                  } else if (state is HomeLoaded) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        menu(),
                        const SizedBox(height: 10,),
                        feeds(state.listRecommended),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu(){
    var size = MediaQuery.of(navGK.currentContext!).size;
    const double itemHeight = 300;
    final double itemWidth = size.width / 1.8;
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 100,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listMenu.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemBuilder: (BuildContext context, int index) { 
          return InkWell(
            onTap: () => BlocProvider.of<HomeCubit>(context).onClickMenu(listMenu[index].first),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  listMenu[index].last,
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

  Widget feeds(List<RecommendedResponse> listRecommended){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Component.textBold("Rekomendasi", colors: PintuPayPalette.darkBlue),
        const SizedBox(height: 20,),
        SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: listRecommended.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  if(listRecommended[index].transactionType?.toLowerCase() == "pulsa"){
                    bottomsheetRecommended(Pulsa(
                      id: listRecommended[index].productId,
                      name: listRecommended[index].productName,
                      price: listRecommended[index].price,
                      providerName: listRecommended[index].providerName
                    ));
                  }
                },
                child: Card(
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ViewUsecase.iconTransaction(listRecommended[index].transactionType ?? ""),
                              height: 20,
                              // height: SizeConfig.blockSizeHorizontal * 13,
                            ),
                            const SizedBox(width: 10,),
                            Component.textBold(listRecommended[index].transactionType ?? "", colors: PintuPayPalette.darkBlue),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Component.textBold(listRecommended[index].productName ?? "", colors: PintuPayPalette.darkBlue),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Component.textBold(
                              CoreFunction.moneyFormatter(listRecommended[index].price ?? ""),
                              fontSize: 13,
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
                    )
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}