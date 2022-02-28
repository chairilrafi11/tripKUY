import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/profile/bloc/profile_bloc.dart';
import 'package:benpay/ui/profile/bloc/profile_menu_bloc.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final ProfileBloc _profileBloc = ProfileBloc();
  final ProfileMenuBloc _profileMenuBloc = ProfileMenuBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BenpayPalette.darkBlue,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InkWell(
                onTap: () async {},
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 100,
                          color: BenpayPalette.darkBlue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Component.textDefault(
                                    'Toko Raditya Dean',
                                    maxLines: 1),
                              ),
                              FittedBox(
                                  child: Component.textDefault(
                                'radityadean91@gmail.com',
                                maxLines: 1,
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _profileBloc.listMenu.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        _profileMenuBloc.navFeature(
                            _profileBloc.listMenu[index].profileMenu);
                      },
                      child: Container(
                          padding:
                              EdgeInsets.all(SizeConfig.safeBlockVertical * 2),
                          width: SizeConfig.safeBlockHorizontal * 100,
                          decoration: const BoxDecoration(
                              color: BenpayPalette.white,
                              border: Border(
                                  bottom: BorderSide(
                                      color: BenpayPalette.darkBlue,
                                      width: 0.5))),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                _profileBloc.listMenu[index].icons,
                                color: BenpayPalette.darkBlue,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                _profileBloc.listMenu[index].label!,
                                style: const TextStyle(
                                    color: BenpayPalette.darkBlue,
                                    fontSize: 14),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios,
                                  color: BenpayPalette.darkBlue, size: 15)
                            ],
                          )),
                    );
                  }),
              InkWell(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    width: SizeConfig.safeBlockHorizontal * 100,
                    color: BenpayPalette.white,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Icon(
                          Icons.exit_to_app,
                          color: BenpayPalette.darkBlue,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Keluar",
                          style: TextStyle(
                              color: BenpayPalette.darkBlue, fontSize: 14),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            color: BenpayPalette.darkBlue, size: 15)
                      ],
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
