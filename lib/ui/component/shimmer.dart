import 'package:flutter/material.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPulsa extends StatelessWidget {
  const ShimmerPulsa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const double itemHeight = 320;
    final double itemWidth = size.width / 1.8;
    double containerHeight = 15;

    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(10),
            child: Shimmer.fromColors(
              period: const Duration(milliseconds: CoreVariable.durationShimmer),
              highlightColor: PintuPayPalette.white,
              baseColor: PintuPayPalette.grey200,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Foto
                    Container(
                      height: 150,
                      width: 165,
                      color: PintuPayPalette.grey200,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: containerHeight,
                            width: 100,
                            color: PintuPayPalette.grey200,
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: containerHeight,
                            width: 150,
                            color: PintuPayPalette.grey200,
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: containerHeight,
                            width: 100,
                            color: PintuPayPalette.grey200,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: CoreVariable.durationShimmer),
      highlightColor: PintuPayPalette.white,
      baseColor: PintuPayPalette.grey200,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext builder, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: SizeConfig.blockSizeHorizontal * 10,
            width: SizeConfig.blockSizeHorizontal * 80,
            color: PintuPayPalette.grey200,
          );
        }
      ),
    );
  }
}

class ShimmerBanner extends StatelessWidget {
  const ShimmerBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: CoreVariable.durationShimmer),
        highlightColor: PintuPayPalette.white,
        baseColor: PintuPayPalette.grey200,
        child: Container(
          height: 130,
          color: PintuPayPalette.grey200,
        ),
      )
    );
  }
}
  
class ShimmerMenu extends StatelessWidget {
  const ShimmerMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: SizeConfig.blockSizeHorizontal * 100,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (80 / 100),
        ),
        itemBuilder: (BuildContext context, int index) { 
          return Shimmer.fromColors(
            period: const Duration(milliseconds: CoreVariable.durationShimmer),
            highlightColor: PintuPayPalette.white,
            baseColor: PintuPayPalette.grey200,
            child: Container(
              height: 70,
              margin: const EdgeInsets.symmetric(),
              color: PintuPayPalette.grey200,
            ),
          );
        },
      ),
    );
  }
}
