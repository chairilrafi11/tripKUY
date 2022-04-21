import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/helpdesk/model/helpdesk_response.dart';
import '../../component/component.dart';
import '../cubit/helpdesk_cubit.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar('Tentang Aplikasi'),
      backgroundColor: PintuPayPalette.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
        child: BlocBuilder<HelpdeskCubit, HelpdeskState>(
          builder: (context, state) {
            if (state is HelpdeskLoaded) {
              return loaded(state.listData.firstWhere((element) => element.title == "about"));
            } else if (state is HelpdeskLoading) {
              return const ShimmerPage();
            }else {
              return Container();
            }
          },
        )
      ),
    );
  }

  Widget loaded(HelpDeskResponse helpDeskResponse){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: SizeConfig.blockSizeVertical * 10),
        Image.asset('assets/icons/logo.png', height: SizeConfig.blockSizeVertical * 20,),
        Component.textBold(
          CoreFunction.version() + " (5)",
          textAlign: TextAlign.center,
          fontSize: PintuPayConstant.fontSizeLargeExtra
        ),
        const SizedBox(height: 20,),
        Component.textDefault(
          helpDeskResponse.body ?? "",
          textAlign: TextAlign.center,
          maxLines: 10
        ),
        const SizedBox(height: 20,),
        Component.textDefault(
          "Copyright@2022 PintuPay \n All right reserved",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}