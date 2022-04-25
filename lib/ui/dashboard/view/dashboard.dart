import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/balance/cubit/balance_cubit.dart';
import 'package:pintupay/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:pintupay/ui/home/cubit/home_cubit.dart';
import 'package:pintupay/ui/home/view/home.dart';
import 'package:pintupay/ui/notification/cubit/notification_cubit.dart';
import 'package:pintupay/ui/notification/view/notification_view.dart';
import 'package:pintupay/ui/profile/cubit/profile_cubit.dart';
import 'package:pintupay/ui/profile/view/profile_view.dart';
import 'package:pintupay/ui/transaction/cubit/transaction_cubit.dart';
import 'package:pintupay/ui/transaction/view/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                          BlocProvider(
                            create: (context) => BalanceCubit(),
                          ),
                          BlocProvider(
                            create: (context) => HomeCubit(),
                          ),
                        ],
                        child: const Home(),
                      );
                    case NavBarItem.transaction:
                      return BlocProvider(
                        create: (context) => TransactionCubit(),
                        child: const TransactionView(),
                      );
                    case NavBarItem.notification:
                      return BlocProvider(
                        create: (context) => NotificationCubit(),
                        child: const NotificationView(),
                      );
                    case NavBarItem.profile:
                      return BlocProvider(
                        create: (context) => ProfileCubit(),
                        child: ProfilePage(),
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
          backgroundColor: PintuPayPalette.white,
          currentIndex: state.navBarItem.index,
          selectedItemColor: PintuPayPalette.darkBlue,
          onTap: (index) => dashboardCubit.pickItem(index),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: PintuPayPalette.darkBlue),
              icon: Icon(Icons.home, color: PintuPayPalette.grey),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.article, color: PintuPayPalette.darkBlue),
              icon: Icon(Icons.article, color: PintuPayPalette.grey),
              label: "Transaksi",
            ),
            BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.notifications, color: PintuPayPalette.darkBlue),
              icon: Icon(Icons.notifications, color: PintuPayPalette.grey),
              label: "Notifikasi",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: PintuPayPalette.darkBlue),
              icon: Icon(Icons.person, color: PintuPayPalette.grey),
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
  //     backgroundColor: PintuPayPalette.darkBlue,
  //     child: const Icon(Icons.qr_code_scanner,
  //         color: PintuPayPalette.white, size: 40),
  //     onPressed: () {
  //       // routePush(const QRPage());
  //       // CoreFunction.showToast("Segera datang", backgroundColor: PintuPayPalette.green);
  //     }
  //   ),
  // );
}
