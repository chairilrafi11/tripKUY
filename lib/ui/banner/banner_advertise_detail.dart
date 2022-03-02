import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/banner_advertise_model.dart';

// ignore: must_be_immutable
class BannerAdvertiseDetail extends StatelessWidget {

  final String? title;
  final BannerResponse? bannerAdvertiseResponse;

  const BannerAdvertiseDetail({Key? key, this.title, this.bannerAdvertiseResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PintuPayPalette.white,
      appBar: Component.appBar( "Detail Banner"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                bannerAdvertiseResponse!.imageUrl!,
                fit: BoxFit.fill,
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeHorizontal * 40,
              ),
            ),
            const SizedBox(height: 20,),
            Component.textBold(bannerAdvertiseResponse?.bannerName ?? "", textAlign: TextAlign.center),
            const SizedBox(height: 20,),
            Component.textDefault(bannerAdvertiseResponse?.description ?? "", maxLines: 20,)
          ],
        ),
      )
    );
  }
}
