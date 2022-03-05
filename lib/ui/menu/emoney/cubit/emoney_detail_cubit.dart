import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/menu/emoney/provider/emoney_provider.dart';

part 'emoney_detail_state.dart';

class EmoneyDetailCubit extends Cubit<EmoneyDetailState> {
  
  EmoneyDetailCubit() : super(EmoneyDetailLoading());
  
  Future onGetProviderDetail(String providerId) async {
    var emoneys = await EmoneyProvider.providerDetail(providerId);
    // emit(EmoneyLoaded(list: emoneys));
  }
}
