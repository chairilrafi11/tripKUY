import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/menu/emoney/cubit/emoney_cubit.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_provder.dart';
import 'package:pintupay/ui/menu/emoney/view/emoney_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

class EmoneyView extends StatelessWidget {

  EmoneyView({ Key? key }) : super(key: key);

  final EmoneyCubit emoneyCubit = EmoneyCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => emoneyCubit..onGetProvider(),
        child: BlocBuilder<EmoneyCubit, EmoneyState>(
          builder: (context, state) {
            return Stack(
              children: [
                Component.header(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Component.appBar("E-Money", transparet: true),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: TextFormField(
                            // controller: phoneContactController,
                            decoration: Component.decorationNoBorder("Cari produk E-Money"),
                            maxLength: 16,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Wajib diisi*";
                              }
                            },
                          ),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => emoneyCubit,
                        child: BlocBuilder<EmoneyCubit, EmoneyState>(
                          builder: (context, state) {
                            if (state is EmoneyLoading) {
                              return const ShimmerList();
                            } else if (state is EmoneyLoaded) {
                              return listEmoney(state.list);
                            } else {
                              return Container();
                            }
                          },
                        )
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        )
      ) 
    ); 
  }

  Widget listEmoney(List<EmoneyProviderResponse> list) {
    return Flexible(
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => emoneyCubit.navDetail(list[index]),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [                
                    CachedNetworkImage(
                      imageUrl: list[index].iconPath ?? "",
                      fit: BoxFit.fill,
                      width: SizeConfig.blockSizeHorizontal * 10,
                      placeholder: (context, url) => const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.wallet_giftcard, 
                        size: 50, 
                        color: PintuPayPalette.darkBlue,
                      )
                    ),
                    const SizedBox(width: 10,),
                    Component.textBold(list[index].name ?? "", colors: PintuPayPalette.darkBlue),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}