import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/banner/view/banner_advertise_detail.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/ui/component/shimmer.dart';

import '../cubit/banner_cubit.dart';

class BannerAdvertiseView extends StatelessWidget {
  const BannerAdvertiseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerLoaded) {
          return _bannerLoaded(context, state);
        } else if (state is BannerLoading) {
          return const ShimmerBanner();
        } else {
          return Component.textBold("Error");
        }
      },
    );
  }

  Column _bannerLoaded(BuildContext context, BannerLoaded state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 140,
            initialPage: 0,
            aspectRatio: 16 / 9,
            enableInfiniteScroll: true,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) => BlocProvider.of<BannerCubit>(context).setDot(index)
          ),
          items: state.listBanner.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => routePush(BannerAdvertiseDetailView(bannerAdvertiseResponse: i), RouterType.material),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        imageUrl: i.imageUrl!,
                        fit: BoxFit.fill,
                        width: 1000.0,
                        placeholder: (context, url) => const ShimmerBanner(),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/banner_0.png",
                          fit: BoxFit.cover,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          height: SizeConfig.blockSizeHorizontal * 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: state.listBanner
              .asMap()
              .map((index, value) => MapEntry(index, dot(state.curentDot ,index, context)))
              .values
              .toList(),
          ),
        )
      ],
    );
  }

  Widget dot(int currentIndex, int index, BuildContext context) {
    return currentIndex == index
      ? const Icon(Icons.circle, color: PintuPayPalette.darkBlue, size: 10)
      : const Icon(Icons.horizontal_rule, color: PintuPayPalette.darkBlue, size: 10);
  }
}
