import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/menu/emoney/cubit/emoney_detail_cubit.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_payment_request.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_provder.dart';
import 'package:pintupay/ui/menu/emoney/provider/emoney_provider.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';

import '../../../../core/usecase/view_usecase.dart';
import '../model/emoney_product_response.dart';
import '../view/emoney_detail_view.dart';

part 'emoney_state.dart';

class EmoneyCubit extends Cubit<EmoneyState> {
  EmoneyCubit() : super(EmoneyLoading());

  Future onGetProvider() async {
    var emoneys = await EmoneyProvider.provider();
    emit(EmoneyLoaded(list: emoneys));
  }

  void navDetail(EmoneyProviderResponse emoneyProviderResponse) {
    routePush(
        BlocProvider(
          create: (context) => EmoneyDetailCubit(emoneyProviderResponse: emoneyProviderResponse),
          child: EmoneyDetailView(),
        ),
        RouterType.material);
  }
}
