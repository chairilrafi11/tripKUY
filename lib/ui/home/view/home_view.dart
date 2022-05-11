import 'package:courier/core/pintupay/pintupay_constant.dart';
import 'package:courier/core/util/util.dart';
import 'package:courier/ui/component/component.dart';
import 'package:courier/ui/home/model/repost_menu.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  HomeView({ Key? key }) : super(key: key);

  final List<Reportmenu> listReport =[
    Reportmenu(label: "Orderan Hari Ini", count: 30, reportMenuKey: ReportMenuKey.total),
    Reportmenu(label: "Menunggu Konfirmasi", count: 01, reportMenuKey: ReportMenuKey.confirm),
    Reportmenu(label: "Orderan Selesai", count: 22, reportMenuKey: ReportMenuKey.finish),
    Reportmenu(label: "Orderan Dibalkan", count: 2, reportMenuKey: ReportMenuKey.cancel),
    Reportmenu(label: "Orderan Berlangsung", count: 13, reportMenuKey: ReportMenuKey.ongoing),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(navGK.currentContext!).size;
    const double itemHeight = 200;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CourierPalette.orange,
        elevation: 0.0,
        title: Component.textBold(
          "Menara Imperium", 
          fontSize: PintuPayConstant.fontSizeLargeExtra,
          colors:CourierPalette.white
        ),
        actions: [
          const Icon(
            Icons.logo_dev,
            size: 50,
            color: CourierPalette.white,
          )
        ],
      ),
      backgroundColor: CourierPalette.white,
      body: ListView(
        children: [
          Container(
            padding: PintuPayConstant.paddingScreen,
            color: CourierPalette.orange,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Component.textDefault(
                //       "Menara Imperium",
                //       fontSize: PintuPayConstant.fontSizeLarge,
                //       colors: CourierPalette.white
                //     ),
                //     const Spacer(),
                //     const Icon(
                //       Icons.logo_dev,
                //       size: 50,
                //       color: CourierPalette.white,
                //     )
                //   ],
                // ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 70,
                      color: CourierPalette.white,
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Component.textBold(
                          "Chairil Rafi Purnama", 
                          fontSize: 22,
                          colors: CourierPalette.white
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {
                            // setState(() {
                            //   isSwitched = value;
                            //   print(isSwitched);
                            // });
                          },
                          activeTrackColor: CourierPalette.white,
                          activeColor: CourierPalette.green,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          right: 30.0,
                          left: 10.0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.wallet_membership,
                                  color: CourierPalette.orange,
                                ),
                                const SizedBox(width: 5,),
                                Component.textDefault("Saldo Anda", fontSize: 12),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            Component.textBold(CoreFunction.moneyFormatter(500000), fontSize: 20),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: CourierPalette.orange,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Component.textDefault("Topup", colors: CourierPalette.white)
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.task,
                              color: CourierPalette.orange,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Component.textDefault("Penarikan", colors: CourierPalette.white)
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                              child: Icon(
                              Icons.history,
                              color: CourierPalette.orange,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Component.textDefault("Riwayat", colors: CourierPalette.white)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: CourierPalette.orange,
            child: Container(
              padding: PintuPayConstant.paddingScreen,
              decoration: const BoxDecoration(
                color: CourierPalette.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Component.textBold("Area Kerja", fontSize: PintuPayConstant.fontSizeLargeExtra),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal * 30,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal * 30,
                            width: SizeConfig.blockSizeHorizontal * 40,
                            child: Component.textBold("Bandung"),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // ListView.builder(
                  //   itemCount: 2,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Card(
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             const Icon(
                  //               Icons.card_travel,
                  //               size: 50,
                  //               color: CourierPalette.orange,
                  //             ),
                  //             const SizedBox(width: 10,),
                  //             Component.textBold("Lihat Order", fontSize: 20,),
                  //             const Spacer(),
                  //             const Icon(
                  //               Icons.arrow_forward_rounded,
                  //               size: 30,
                  //               color: CourierPalette.orange,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  Component.textBold("Laporan", fontSize: PintuPayConstant.fontSizeLargeExtra),
                  const SizedBox(height: 20,),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listReport.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (BuildContext context, int index) { 
                      return InkWell(
                        // onTap: () => BlocProvider.of<HomeCubit>(context).onClickMenu(listMenu[index].first),
                        child: Card(
                          elevation: 3,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              bottom: 10
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image.asset(
                                //   listMenu[index].last,
                                // ),
                                const Icon(
                                  Icons.task_sharp,
                                  size: 40, 
                                  color: CourierPalette.orange,
                                ),
                                const SizedBox(height: 10,),
                                Component.textBold(
                                  listReport[index].label,
                                  fontSize: 15,
                                  colors: CourierPalette.black
                                ),
                                const SizedBox(height: 20,),
                                Component.textBold(
                                  listReport[index].count.toString(),
                                  fontSize: 30
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}