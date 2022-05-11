import 'package:courier/core/util/util.dart';
import 'package:courier/ui/chat/cubit/chat_cubit.dart';
import 'package:courier/ui/chat/view/chat_view.dart';
import 'package:courier/ui/home/view/home_view.dart';
import 'package:courier/ui/order/cubit/order_cubit.dart';
import 'package:courier/ui/order/view/order_view.dart';
import 'package:courier/ui/profile/cubit/profile_cubit.dart';
import 'package:courier/ui/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/cubit/home_cubit.dart';
import '../cubit/dashboard_cubit.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key, this.page = 0}) : super(key: key);
  final int page;

  final DashboardCubit dashboardCubit = DashboardCubit();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) => dashboardCubit..pickItem(page),
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          body: WillPopScope(
              onWillPop: () => dashboardCubit.handleWillPop(),
              child: BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  switch (state.navBarItem) {
                    case NavBarItem.home:
                      return MultiBlocProvider(
                        providers: [
                          // BlocProvider(
                          //   create: (context) => BalanceCubit(),
                          // ),
                          BlocProvider(
                            create: (context) => HomeCubit(),
                          ),
                        ],
                        child:  HomeView(),
                      );
                    case NavBarItem.order:
                      return BlocProvider(
                        create: (context) => OrderCubit(),
                        child: const OrderView(),
                      );
                    case NavBarItem.chat:
                      return BlocProvider(
                        create: (context) => ChatCubit(),
                        child: const ChatView(),
                      );
                    case NavBarItem.profile:
                      return BlocProvider(
                        create: (context) => ProfileCubit(),
                        child: ProfileView(),
                      );
                    default:
                      return Container();
                  }
                },
              )),
          bottomNavigationBar: buildBottomNavigation(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: _buildFloatingActionButton(),
        ));
  }

  Widget buildBottomNavigation() {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: CourierPalette.white,
          currentIndex: state.navBarItem.index,
          selectedItemColor: CourierPalette.orange,
          onTap: (index) => dashboardCubit.pickItem(index),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: CourierPalette.orange),
              icon: Icon(Icons.home, color: CourierPalette.grey),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.article, color: CourierPalette.orange),
              icon: Icon(Icons.article, color: CourierPalette.grey),
              label: "Order",
            ),
            BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.notifications, color: CourierPalette.orange),
              icon: Icon(Icons.notifications, color: CourierPalette.grey),
              label: "Pesan",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: CourierPalette.orange),
              icon: Icon(Icons.person, color: CourierPalette.grey),
              label: "Akun",
            ),
          ],
        );
      },
    );
  }

  //* Widget Scan
  // Widget _buildFloatingActionButton() => Transform.translate(
  //   offset: const Offset(0, -10),
  //   child: FloatingActionButton(
  //     elevation: 15.0,
  //     focusElevation: 2.0,
  //     autofocus: false,
  //     backgroundColor: CourierPalette.orange,
  //     child: const Icon(Icons.qr_code_scanner,
  //         color: CourierPalette.white, size: 40),
  //     onPressed: () {
  //       // routePush(const QRPage());
  //       // CoreFunction.showToast("Segera datang", backgroundColor: CourierPalette.green);
  //     }
  //   ),
  // );
}
