import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/menu/emoney/cubit/emoney_detail_cubit.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_provder.dart';
import 'package:pintupay/ui/menu/emoney/provider/emoney_provider.dart';
import '../view/emoney_detail_view.dart';

part 'emoney_state.dart';

class EmoneyCubit extends Cubit<EmoneyState> {
  EmoneyCubit() : super(EmoneyLoading()){
    onGetProvider();
  }

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
      RouterType.material
    );
  }
}
