import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/bill/model/bill_body_model.dart';
import 'package:pintupay/ui/bill/model/bill_status_model.dart';
import 'package:pintupay/ui/menu/game/model/game_payment_request.dart';
import 'package:pintupay/ui/menu/game/provider/game_provider.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';

import '../../../../core/pintupay/pintupay_crypt.dart';
import '../../../../core/usecase/view_usecase.dart';
import '../../../../core/util/util.dart';
import '../../../bill/view/bill_view.dart';
import '../model/game_product_response.dart';
import '../model/game_provder_response.dart';

part 'game_detail_state.dart';

class GameDetailCubit extends Cubit<GameDetailState> {
  final GameProviderResponse gameProviderResponse;

  GameDetailCubit({required this.gameProviderResponse}) : super(GameDetailLoading()){
    onGetProviderDetail(gameProviderResponse.id.toString());
  }
  
  List<Set<String>> listInformation = [];
  late GamePaymentRequest gamePaymentRequest;

  Future onGetProviderDetail(String providerId) async {
    List<Game> listGame = [];
    var products = await GameProvider.providerDetail(providerId);
    String a = products.game!.first.name!;
    a.replaceAll(label(gameProviderResponse.id!), '');

    for (var element in products.game!) {
      listGame.add(Game(
        name: element.name!.replaceAll(label(gameProviderResponse.id!), ''),
        id: element.id,
        salePrice: element.salePrice,
        type: element.type,
      ));
    }

    if(products.game != null) {
      emit(GameDetailLoaded(
        gameProductResponse: GameProductResponse(game: listGame, form: products.form)
      ));
    } else {
      emit(GameDetailEmpty()); 
    }
  }

  String label(int id){
    switch (id) {
      case 41:
        return "MOBILELEGEND - ";
      default:
        return "";
    }
  }

  onInquiry(String idServer, String id, Game game) {

    GameDetailLoaded gameDetailLoaded = state as GameDetailLoaded;

    listInformation.clear();
    String identifierNumber = "";

    listInformation.add({"Jenis Transaksi", "Game Topup"});

    for (var element in gameDetailLoaded.gameProductResponse.form!) {
      listInformation.add({element.label ?? "" , (element.textEditingController.text)});
      identifierNumber += element.textEditingController.text;
    }

    listInformation.addAll([
      {"Game", gameProviderResponse.name ?? "",},
      {"Product", game.name ?? ""},
      {"Harga", CoreFunction.moneyFormatter(game.salePrice)},
      {"Total Pembayaran", CoreFunction.moneyFormatter(game.salePrice)},
    ]);

    gamePaymentRequest = GamePaymentRequest(
      authToken: authUsecase.userBox.authToken,
      transaction: Transaction(
        balance: PintuPayConstant.paymentCash,
        indentifierNumber: identifierNumber,
        messages: game.name,
        transactionTypeId: 36,
        productPriceId: game.id,
        providerId: gameProviderResponse.id,
        userId: authUsecase.userBox.id
      )
    );

    routePush(
      PaymentView(
        listInformation: listInformation,
        paymentMethod: onPayment,
        feature: Feature.game,
      ), 
      RouterType.material
    );
  }

  onPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {

        gamePaymentRequest.pin = value;

        var payment = PintuPayCrypt().encrypt(jsonEncode(gamePaymentRequest), await PintuPayCrypt().getPassKeyPref());
        var result = await GameProvider.payment(BodyRequestV7(payment, payment).toJson());

        if(result.id != null) {

          BillStatusModel billStatusModel = BillStatusModel(
            billBody: listInformation.map((e){
              return BillBodyModel(e.first, e.last);
            }).toList(),
            status: "",
          );

          routePush(
            BillView(
              billStatusModel: billStatusModel,
              billStatus: BillStatus.pending,
              messages: result.messages,
            ),
            RouterType.material
          );
        }
      }
    });
  }

}
