import 'dart:async';
import 'package:benpay/ui/banner/model/banner_advertise_model.dart';
import 'package:benpay/ui/banner/provider/banner_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';

import '../banner_advertise_detail.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  
  BannerCubit(String type) : super(BannerLoading()){
    fetchDataBanner(type);
  }

  // final BehaviorSubject<int> _dot = BehaviorSubject<int>();

  // Stream<int> get dotObservable => _dot.stream;

  fetchDataBanner(String type) async => emit(BannerLoaded(listBanner: await BannerProvider().fetchBanner(type)));

  setDot(int index) {
    // _dot.add(index);
  }

  // navDetail(BannerResponse value) => routePush(BannerAdvertiseDetail(bannerAdvertiseResponse: value));

  closeController(){
    // _dot.close();
  }

}
