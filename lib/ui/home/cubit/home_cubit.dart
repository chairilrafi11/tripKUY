import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/ui/home/provider/home_provider.dart';
import 'package:pintupay/ui/menu/bpjs/cubit/bpjs_cubit.dart';
import 'package:pintupay/ui/menu/bpjs/view/bpjs_view.dart';
import 'package:pintupay/ui/menu/data_plan/view/data_plan_view.dart';
import 'package:pintupay/ui/menu/electric/cubit/electric_cubit.dart';
import 'package:pintupay/ui/menu/electric/view/electric_view.dart';
import 'package:pintupay/ui/menu/emoney/cubit/emoney_cubit.dart';
import 'package:pintupay/ui/menu/emoney/view/emoney_view.dart';
import 'package:pintupay/ui/menu/game/cubit/game_cubit.dart';
import 'package:pintupay/ui/menu/game/view/game_view.dart';
import 'package:pintupay/ui/menu/pdam/cubit/pdam_cubit.dart';
import 'package:pintupay/ui/menu/pdam/view/pdam_view.dart';
import 'package:pintupay/ui/menu/phone_postpaid/view/phone_postpaid_view.dart';
import 'package:pintupay/ui/menu/pulsa/cubit/pulsa_cubit.dart';
import 'package:pintupay/ui/menu/pulsa/view/pulsa_view.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/view/telephone_postpaid_view.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';

import '../../menu/phone_postpaid/cubit/phone_postpaid_cubit.dart';
import '../model/menu_response.dart';
import '../model/recommended_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading()) {
    onGetRecommended();
  }

  void onClickMenu(String key) {
    switch (key.toLowerCase()) {
      case "bpjs":
        routePush(
          BlocProvider(
            create: (context) => BpjsCubit()..onRecentNumber(),
            child: const BPJSView(),
          ),
          RouterType.material
        );
        break;
      case "e-money":
        routePush(
            BlocProvider(
              create: (context) => EmoneyCubit(),
              child: const EmoneyView(),
            ),
            RouterType.material);
        break;
      case "hp pascabayar":
        routePush(
          BlocProvider(
            create: (BuildContext context) => PhonePostpaidCubit(),
            child: const PhonePostpaidView(),
          ),
          RouterType.cupertino,
        );
        break;
      case "listrik":
        routePush(
            BlocProvider(
              create: (context) => ElectricCubit(),
              child: ElectricView(),
            ),
            RouterType.material);
        break;
      case "pdam":
        routePush(
          BlocProvider(
            create: (context) => PdamCubit(),
            child: PDAMView(),
          ),
          RouterType.material,
        );
        break;
      case "pulsa &\n data":
        routePush(
            BlocProvider(
              create: (context) => PulsaCubit(),
              child: PulsaView(),
            ),
            RouterType.material);
        break;
      case "telepon":
        routePush(TelephonePostpaid(), RouterType.material);
        break;
      case "paket \n data":
        routePush(const DataPlanView(), RouterType.material);
        break;
      case "game":
        routePush(
            BlocProvider(
              create: (context) => GameCubit(),
              child: const GameView(),
            ),
            RouterType.material);
        break;
      // default:
    }
  }

  Future onGetMenu() async {
    emit(HomeLoaded(
        listMenu: await HomeProvider.menus(), listRecommended: const []));
  }

  Future onGetRecommended() async {
    emit(HomeLoaded(
        listMenu: const [], listRecommended: await HomeProvider.recommended()));
  }
}
