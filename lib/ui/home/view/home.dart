import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/balance/view/balance_view.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Image.asset(
            "assets/icons/group.png",
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 23,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/banner.png",
                  height: SizeConfig.blockSizeVertical * 17,
                  width: SizeConfig.blockSizeHorizontal * 100,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Balance(),
                        Spacer(),
                        Poin()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          menu(),
          const SizedBox(height: 10,),
          feeds(),
        ],
      ),
    );
  }

  Widget menu(){
    return SizedBox(
      height: 230,
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
          return Column(
            children: [
              const Icon(Icons.star, size: 50, color: BenpayPalette.darkBlue),
              const SizedBox(height: 10,),
              Component.textBold("Menu")
            ],
          );
        },
      ),
    );
  }

  Widget feeds(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Component.textBold("Recommended", colors: BenpayPalette.darkBlue),
          const SizedBox(height: 20,),
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.bottomLeft,
                  color: BenpayPalette.green,
                  width: SizeConfig.blockSizeHorizontal * 50,
                  child: Component.textBold("Feeds", colors: BenpayPalette.white)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}