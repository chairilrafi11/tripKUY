import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/ui/component/component_dialog.dart';
import 'package:pintupay/ui/topup/model/bank_response.dart';
import 'package:pintupay/ui/topup/model/topup_confirm_model.dart';
import 'package:pintupay/ui/topup/provider/topup_provider.dart';

import '../../../core/pintupay/pintupay_crypt.dart';
import '../../../core/usecase/auth_usecase.dart';
import '../model/topup_request_model.dart';

part 'topup_input_state.dart';

class TopupInputCubit extends Cubit<TopupInputState> {
  TopupInputCubit() : super(TopupInputInitial());

  Future onRequestTopup(TopupRequestModel topupRequestModel, BankResponse bankResponse) async {
    topupRequestModel.authToken = authUsecase.userBox.authToken!;
    var topupRequest = PintuPayCrypt().encrypt(jsonEncode(topupRequestModel), await PintuPayCrypt().getPassKeyPref());
    var result = await TopupProvider.request(PostBody(topupRequest).toJson());

    if(result.id != null){
      //? Confirm Topup
      TopupConfirmModel topupConfirmModel = TopupConfirmModel(
        authToken: authUsecase.userBox.authToken!,
        id: result.id,
        transactionCode: result.serialNumber
      );
      var topupConfirm = PintuPayCrypt().encrypt(jsonEncode(topupConfirmModel), await PintuPayCrypt().getPassKeyPref());
      await TopupProvider.confirm(PostBody(topupConfirm).toJson());

      ComponentDialog.successTopup();

    }
  }

}
