import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/database/box/notification/notification_box.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/notification/cubit/notification_cubit.dart';

import '../../../core/util/size_config.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PintuPayPalette.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Component.textBold("Notifikasi", fontSize: PintuPayConstant.fontSizeLargeExtra, textAlign: TextAlign.start),
              const SizedBox(height: 10,),
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  if(state is NotificationLoaded){
                    return notification(state.listNotification);
                  } else if (state is NotificationLoading) {
                    return const ShimmerList();
                  } else if (state is NotificationEmpty) {
                    return empty();
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        )
      ),
    );
  }

  Widget notification(List<NotificationBox> listNotifcation){
    return Flexible(
      child: ListView.builder(
        itemCount: listNotifcation.length,
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => BlocProvider.of<NotificationCubit>(context).showDialog(listNotifcation[index]),
            child: Card(
              margin: EdgeInsets.only(top: 5, bottom: index == (listNotifcation.length -1) ? 100 : 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                
                    Row(
                      children: [
                        // Image.asset( 
                        //   "assets/icons/icmn_bpjs.png",
                        //   height: 20,
                        // ),
                        const Icon(
                          Icons.info,
                          size: 25,
                          color: PintuPayPalette.darkBlue,
                        ),
                        const SizedBox(width: 10,),
                        Component.textBold(listNotifcation[index].notificationType ?? ""),
                        const Spacer(),
                        // Component.textDefault("28 Februari 2022", fontSize: 11)
                      ],
                    ),
                    Component.divider(),
                    const SizedBox(height: 10,),
                    Component.textBold(
                      listNotifcation[index].dataTitle ?? "",
                      fontSize: PintuPayConstant.fontSizeMedium
                    ),
                    const SizedBox(height: 10,),
                    Component.textDefault(
                      listNotifcation[index].dataBody ?? "",
                      fontSize: PintuPayConstant.fontSizeSmall
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Widget empty(){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: SizeConfig.blockSizeHorizontal * 50,),
          Image.asset(
            "assets/images/empty_transaction.png",
            height: SizeConfig.blockSizeHorizontal * 50,
            width: SizeConfig.blockSizeHorizontal * 50,
          ),
          Component.textBold("Belum ada Notifikasi")
        ],
      ),
    );
  }
}