import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/menu/game/provider/game_provider.dart';

import '../model/game_product_response.dart';
import '../model/game_provder_response.dart';

part 'game_detail_state.dart';

class GameDetailCubit extends Cubit<GameDetailState> {
  final GameProviderResponse gameProviderResponse;

  GameDetailCubit({required this.gameProviderResponse}) : super(GameDetailInitial()){
    onGetProviderDetail(gameProviderResponse.id.toString());
  }

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
      emit(GameDetailLoaded(gameProductResponse: GameProductResponse(game: listGame)));
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

}
