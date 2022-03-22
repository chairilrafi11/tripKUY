import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/menu/game/cubit/game_detail_cubit.dart';
import 'package:pintupay/ui/menu/game/model/game_provder_response.dart';
import 'package:pintupay/ui/menu/game/provider/game_provider.dart';
import 'package:pintupay/ui/menu/game/view/game_detail_view.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {

  GameCubit() : super(GameLoading()){
    onGetProvider();
  }

  Future onGetProvider() async {
    var provides = await GameProvider.provider();
    emit(GameLoaded(list: provides));
  }

  void navDetail(GameProviderResponse gameProviderResponse) {
    routePush(
      BlocProvider(
        create: (context) => GameDetailCubit(gameProviderResponse: gameProviderResponse),
        child: GameDetailView(),
      ),
      RouterType.material
    );
  }
}
