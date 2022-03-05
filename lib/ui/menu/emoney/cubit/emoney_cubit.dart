import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_provder.dart';
import 'package:pintupay/ui/menu/emoney/provider/emoney_provider.dart';

part 'emoney_state.dart';

class EmoneyCubit extends Cubit<EmoneyState> {

  EmoneyCubit() : super(EmoneyLoading());

  Future onGetProvider() async {
    var emoneys = await EmoneyProvider.provider();
    emit(EmoneyLoaded(list: emoneys));
  }
}
