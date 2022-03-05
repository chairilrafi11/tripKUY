import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/ui/menu/bpjs/view/bpjs_view.dart';
import 'package:pintupay/ui/menu/data_plan/view/data_plan_view.dart';
import 'package:pintupay/ui/menu/electric/view/electric_token_view.dart';
import 'package:pintupay/ui/menu/emoney/view/emoney_view.dart';
import 'package:pintupay/ui/menu/pdam/view/pdam_view.dart';
import 'package:pintupay/ui/menu/phone_postpaid/view/phone_postpaid_view.dart';
import 'package:pintupay/ui/menu/pulsa/view/pulsa_view.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/view/telephone_postpaid_view.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';

import '../../menu/pdam/cubit/pdam_cubit.dart';
import '../../menu/phone_postpaid/cubit/phone_postpaid_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitial());
  
  void onClickMenu(String key) {
    switch (key.toLowerCase()) {
      case "bpjs":
        routePush(const BPJSView(), RouterType.material);
        break;
      case "e-money":
        routePush(const EmoneyView(), RouterType.material);
        break;
      case "hp pascabayar":
        // routePush(const PhonePostpaidView(), RouterType.material);
        routePush(
          BlocProvider(
            create: (BuildContext context) => PhonePostpaidCubit(),
            child: const PhonePostpaidView(),
          ),
          RouterType.cupertino,
        );
        break;
      case "listrik":
        routePush(const ElectricToken(), RouterType.material);
        break;
      case "pdam":
        // routePush(const PDAMView(), RouterType.material);
        routePush(
          BlocProvider(
            create: (BuildContext context) => PdamCubit(),
            child: const PDAMView(),
          ),
          RouterType.cupertino,
        );
        break;
      case "pulsa":
        routePush(PulsaView(), RouterType.material);
        break;
      case "telepon":
        routePush(const TelephonePostpaid(), RouterType.material);
        break;
      case "paket \n data":
        routePush(const DataPlanView(), RouterType.material);
        break;
      // default:
    }
  }


}
