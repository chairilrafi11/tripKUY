import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/menu/pulsa/cubit/pulsa_cubit.dart';
import 'package:pintupay/ui/menu/pulsa/model/recent_number_response.dart';
import 'package:pintupay/ui/menu/pulsa/model/response_pulsa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/usecase/view_usecase.dart';

class PulsaView extends StatelessWidget {
  PulsaView({Key? key}) : super(key: key);

  final TextEditingController phoneContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Component.header(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Component.appBar("Pulsa", transparet: true),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Component.textBold("No. HP",
                              textAlign: TextAlign.start),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BlocBuilder<PulsaCubit, PulsaState>(
                                builder: (context, state) {
                                  if (state is PulsaLoaded) {
                                    return CachedNetworkImage(
                                      width: 50,
                                      imageUrl: state.pulsaProviderResponse
                                              .pulsa?.iconPath ??
                                          "",
                                      placeholder: (context, string) =>
                                          const CupertinoActivityIndicator(),
                                      errorWidget: (context, string, dynamic) =>
                                          const SizedBox(
                                        width: 50,
                                        child: Icon(
                                          Icons.phone,
                                          size: 30,
                                          color: PintuPayPalette.darkBlue,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox(
                                      width: 50,
                                      child: Icon(
                                        Icons.phone,
                                        size: 30,
                                        color: PintuPayPalette.darkBlue,
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: phoneContactController,
                                  decoration: InputDecoration(
                                      fillColor: PintuPayPalette.blueLight
                                          .withAlpha(50),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: PintuPayPalette.white),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: PintuPayPalette.white),
                                      ),
                                      counterText: "",
                                      hintText: "No Handphone",
                                      suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            color: PintuPayPalette.darkBlue,
                                          ),
                                          onPressed: () {
                                            phoneContactController.clear();
                                            BlocProvider.of<PulsaCubit>(context)
                                                .history();
                                          }),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      hintStyle: const TextStyle(
                                          fontSize: 15.0,
                                          color: PintuPayPalette.blue1,
                                          fontWeight: FontWeight.w500)),
                                  onChanged: (value) {
                                    CoreFunction.logPrint(
                                        "Phone Number", value);
                                    CoreFunction.debouncer.debounce(() {
                                      BlocProvider.of<PulsaCubit>(context)
                                          .onInquiry(value);
                                    });
                                  },
                                  maxLength: 16,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "Wajib diisi*";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    var phoneNumber =
                                        (await CoreFunction.getContact())
                                            .replaceAll("+62", "0");
                                    CoreFunction.logPrint(
                                        "Phone Number Contact", phoneNumber);
                                    if (phoneNumber != "") {
                                      phoneContactController.text = phoneNumber;
                                      BlocProvider.of<PulsaCubit>(context)
                                          .onInquiry(phoneNumber);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.contacts,
                                    color: PintuPayPalette.darkBlue,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const TabBar(
                      labelColor: PintuPayPalette.darkBlue,
                      indicatorColor: PintuPayPalette.darkBlue,
                      unselectedLabelColor: PintuPayPalette.grey,
                      tabs: [
                        Tab(
                          text: "Pulsa",
                        ),
                        Tab(text: "Paket Data"),
                      ]),
                  Expanded(child: BlocBuilder<PulsaCubit, PulsaState>(
                    builder: (context, state) {
                      if (state is PulsaEmpty) {
                        return TabBarView(children: [
                          Center(child: Component.textBold("Tidak ada produk")),
                          Center(child: Component.textBold("Tidak ada produk")),
                        ]);
                      } else if (state is PulsaLoaded) {
                        return TabBarView(children: [
                          pulsa(state.responsePulsa.pulsa!),
                          dataPlan(state.responsePulsa.data!),
                        ]);
                      } else if (state is PulsaLoading) {
                        return const TabBarView(children: [
                          ShimmerPulsa(),
                          ShimmerPulsa(),
                        ]);
                      } else if (state is PulsaRecentNumber) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Component.textBold("Transaksi Terakhir"),
                            recentNumber(state.listRecent),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pulsa(List<Pulsa> listPulsa) {
    var size = MediaQuery.of(navGK.currentContext!).size;
    const double itemHeight = 150;
    final double itemWidth = size.width / 1.8;
    return GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20),
      itemCount: listPulsa.length,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => BlocProvider.of<PulsaCubit>(context)
              .confirm(listPulsa[index], phoneContactController.text),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Component.textBold(listPulsa[index].name ?? "",
                      fontSize: PintuPayConstant.fontSizeLarge,
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Component.textBold(
                          CoreFunction.moneyFormatter(listPulsa[index].price),
                          fontSize: PintuPayConstant.fontSizeLarge,
                          colors: PintuPayPalette.orange),
                      const SizedBox(
                        width: 10,
                      ),
                      // const Text(
                      //   "RP 35.000",
                      //   style: TextStyle(
                      //     color: PintuPayPalette.grey,
                      //     fontFamily: PintuPayConstant.avenirRegular,
                      //     fontSize: PintuPayConstant.fontSizeSmall,
                      //     overflow: TextOverflow.ellipsis,
                      //     decoration: TextDecoration.lineThrough
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget dataPlan(List<Data> listData) {
    return ListView.builder(
      itemCount: listData.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => BlocProvider.of<PulsaCubit>(context)
              .confirmData(listData[index], phoneContactController.text),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Component.textBold(listData[index].name ?? "", colors: PintuPayPalette.darkBlue),
                  const SizedBox(
                    height: 10,
                  ),
                  Component.textBold(listData[index].name ?? "",
                      fontSize: PintuPayConstant.fontSizeMedium),

                  InkWell(
                    onLongPress: () {
                      Clipboard.setData(
                          ClipboardData(text: listData[index].explainField));
                      CoreFunction.showToast("teks berhasil disalin",
                          backgroundColor: PintuPayPalette.darkBlue);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Text(
                          listData[index].explainField ?? "",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 20, 19, 20),
                              fontSize: 12),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Component.textBold(
                          CoreFunction.moneyFormatter(listData[index].price),
                          fontSize: 13,
                          colors: PintuPayPalette.orange),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget recentNumber(List<RecentNumberResponse> listRecent) {
    if (listRecent.isNotEmpty) {
      return ListView.builder(
        itemCount: listRecent.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              BlocProvider.of<PulsaCubit>(context)
                  .onInquiry(listRecent[index].numbers.toString());
              phoneContactController.text = listRecent[index].numbers ?? "";
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ViewUsecase.iconFeature(Feature.pulsa),
                      height: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Component.textBold(listRecent[index].numbers ?? "",
                        fontSize: PintuPayConstant.fontSizeLarge,
                        colors: PintuPayPalette.darkBlue),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Component.emptyRecent();
    }
  }
}
