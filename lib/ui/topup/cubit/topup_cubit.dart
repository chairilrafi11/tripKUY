import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/topup/model/bank_response.dart';
import 'package:pintupay/ui/topup/provider/topup_provider.dart';

import '../view/topup_input_view.dart';

part 'topup_state.dart';

class TopupCubit extends Cubit<TopupState> {

  TopupCubit() : super(TopupLoading()){
    onGetBank();
  }

  Future onGetBank() async {
   emit(TopupLoaded(listBank: await TopupProvider.bank()));
  }

  void navNominal(BankResponse value){
    routePush(TopupInputView(bankResponse: value,), RouterType.material);
  }
}
