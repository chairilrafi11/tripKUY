import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import '../../../core/util/core_function.dart';
import '../../../core/util/size_config.dart';
import '../../component/component.dart';
import '../cubit/helpdesk_cubit.dart';
import '../model/helpdesk_response.dart';

class HelpdeskUsView extends StatelessWidget {
  const HelpdeskUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PintuPayPalette.white,
      appBar: Component.appBar('Helpdesk Us'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: BlocBuilder<HelpdeskCubit, HelpdeskState>(
          builder: (context, state) {
            if (state is HelpdeskLoaded) {
              return loaded(state.listData);
            } else if (state is HelpdeskLoading) {
              return const ShimmerPage();
            } else {
              return Container();
            }
          },
        )
      ),
    );
  }
  
  Widget loaded(List<HelpDeskResponse> listData){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: SizeConfig.blockSizeVertical * 10,
        ),
        Image.asset(
          "assets/icons/logo_cs.jpg",
          height: SizeConfig.blockSizeHorizontal * 60,
        ),
        const SizedBox(
          height: 50,
        ),
        Component.textDefault(
          "Anda bisa memberitahu kami dengan salah satu kontak di bawah",
          textAlign: TextAlign.center
        ),
        const SizedBox(
          height: 30,
        ),
        ListView.builder(
          itemCount: listData.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            if(listData[index].title == "contact-us"){
              return whatsAppButton(listData[index].body ?? "");
            } else if (listData[index].title == "email-us") {
              return emailButton(listData[index].body ?? "");
            } else {
              return Container();
            }
          },
        ),
        const SizedBox(height: 10,),
      ],
    );
  }

  Widget emailButton(String email){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: PintuPayPalette.white,
        elevation: 1.0,
        shadowColor: PintuPayPalette.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onPressed: () {
        CoreFunction.navToAnotherApps(
          email: email,
          message: 'Assalamualaikum admin, saya mau bertanya',
        );
      },
      child: Row(
        children: [
          const Icon(
            Icons.email,
            color: PintuPayPalette.darkBlue,
            size: 35,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Component.textDefault(email),
        ],
      ),
    );
  }

  Widget whatsAppButton(String whatsappNumber){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: PintuPayPalette.white,
        elevation: 1.0,
        shadowColor: PintuPayPalette.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onPressed: () {
        CoreFunction.navToAnotherApps(
          phoneNumber: whatsappNumber.replaceRange(0, 0, '+62'),
          whatsApp: true,
          message: 'Assalamualaikum admin, saya mau bertanya'
        );
      },
      child: Row(
        children: [
          const Icon(
            Icons.whatsapp,
            color: PintuPayPalette.green,
            size: 35,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            children: [
              Component.textDefault(whatsappNumber),
            ],
          ),
        ],
      ),
    );
  }
}
