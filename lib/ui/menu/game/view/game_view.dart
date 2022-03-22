import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/ui/menu/game/cubit/game_cubit.dart';
import 'package:pintupay/ui/menu/game/model/game_provder_response.dart';

import '../../../../core/pintupay/pintupay_palette.dart';
import '../../../../core/util/size_config.dart';
import '../../../component/component.dart';
import '../../../component/shimmer.dart';

class GameView extends StatelessWidget {
  
  const GameView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return Stack(
            children: [
              Component.header(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Component.appBar("Game - Voucher", transparet: true),
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: TextFormField(
                          // controller: phoneContactController,
                          decoration: Component.decorationNoBorder("Cari game"),
                          maxLength: 16,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Wajib diisi*";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    BlocBuilder<GameCubit, GameState>(
                      builder: (context, state) {
                        if (state is GameLoading) {
                          return const ShimmerList();
                        } else if (state is GameLoaded) {
                          return listGame(state.list);
                        } else {
                          return Container();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ) 
    ); 
  }

  Widget listGame(List<GameProviderResponse> list) {
    return Flexible(
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => BlocProvider.of<GameCubit>(context).navDetail(list[index]),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, 
                bottom: 10,
                right: 20
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: CachedNetworkImage(
                  imageUrl: list[index].iconPath ?? "",
                  fit: BoxFit.fill,
                  height: SizeConfig.blockSizeHorizontal * 45,
                  width: SizeConfig.blockSizeHorizontal * 100,
                  placeholder: (context, url) => const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.games,
                    color: PintuPayPalette.darkBlue,
                    size: 100,
                  )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}