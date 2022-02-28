import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/banner_cubit.dart';

class BannerAdvertise extends StatelessWidget {
  const BannerAdvertise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerLoaded) {
          return _bannerLoaded(context, state);
        } else if (state is BannerLoading) {
          // return const ShimmerBanner();
          return CupertinoActivityIndicator();
        } else {
          return Component.textBold("Error");
        }
      },
    );
  }

  Stack _bannerLoaded(BuildContext context, BannerLoaded state) {
    return Stack(
      alignment: Alignment.center,
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
                    // onTap: () => BlocProvider.of<BannerCubit>(context).navDetail(i),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                          i.imageUrl!,
                          fit: BoxFit.fill,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          height: SizeConfig.blockSizeHorizontal * 40,
                        ),
                      // child: CachedNetworkImage(
                      //   imageUrl: i.imageUrl!,
                      //   fit: BoxFit.fill,
                      //   width: 1000.0,
                      //   placeholder: (context, url) => const ShimmerBanner(),
                      //   errorWidget: (context, url, error) => Image.asset(
                      //     "assets/images/banner_1.png",
                      //     fit: BoxFit.cover,
                      //     width: SizeConfig.blockSizeHorizontal * 100,
                      //     height: SizeConfig.blockSizeHorizontal * 40,
                      //   ),
                      // ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        // Positioned(
        //   bottom: 2,
        //   child: Container(
        //     margin: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: state.listBanner
        //         .asMap()
        //         .map((index, value) => MapEntry(index, dot(index, context)))
        //         .values
        //         .toList(),
        //     ),
        //   ),
        // )
      ],
    );
  }

  // Widget dot(int index, BuildContext context) {
  //   return StreamBuilder<int>(
  //     initialData: 0,
  //     stream: BlocProvider.of<BannerCubit>(context).dotObservable,
  //     builder: (context, AsyncSnapshot<int> snapshot) {
  //       return snapshot.data == index
  //         ? const Icon(Icons.circle, color: BenpayPalette.white, size: 10)
  //         : const Icon(Icons.horizontal_rule, color: BenpayPalette.white, size: 10);
  //     }
  //   );
  // }
}
