import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/topup/model/bank_response.dart';
import 'package:pintupay/ui/topup/model/topup_confirm_model.dart';
import 'package:pintupay/ui/topup/provider/topup_provider.dart';
import 'package:pintupay/ui/topup/view/topup_confirm_view.dart';

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

      routePush(TopupConfirmView(
        bankResponse: bankResponse,
        topupRequestResponse: result,
      ), RouterType.material);

    }
  }

}