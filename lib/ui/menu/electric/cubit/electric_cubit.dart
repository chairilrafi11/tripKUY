import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/menu/electric/model/electric_token_response.dart';
import 'package:pintupay/ui/menu/electric/provider/electric_provider.dart';
import 'package:pintupay/ui/menu/electric/view/electric_token_view.dart';

part 'electric_state.dart';

class ElectricCubit extends Cubit<ElectricState> {
  ElectricCubit() : super(ElectricLoading());

  Future onGetToken() async {
    var electricTokenResponse = await ElectricProvider.inquiry();
    emit(ElectricLoaded(electricTokenResponse: electricTokenResponse));
  }

}
