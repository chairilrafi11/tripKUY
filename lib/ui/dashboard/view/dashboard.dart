import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:benpay/ui/home/view/home.dart';
import 'package:benpay/ui/notification/view/notification_view.dart';
import 'package:benpay/ui/profile/view/profile.dart';
import 'package:benpay/ui/transaction/view/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key,this.page = 0}) : super(key: key);
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
                  return Home();
                case NavBarItem.transaction:
                  return const TransactionView();
                case NavBarItem.notification:
                  return const NotificationView();    
                case NavBarItem.profile:
                  return Profile();
                default:
                  return Container();
              }
            },
          )
        ),
        bottomNavigationBar: buildBottomNavigation(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFloatingActionButton(),
      )
    );
  }

  Widget buildBottomNavigation() {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: BenpayPalette.white,
          currentIndex: state.navBarItem.index,
          selectedItemColor: BenpayPalette.darkBlue,
          onTap: (index) => dashboardCubit.pickItem(index),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: BenpayPalette.darkBlue),
              icon: Icon(Icons.home, color: BenpayPalette.grey),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.article, color: BenpayPalette.darkBlue),
              icon: Icon(Icons.article, color: BenpayPalette.grey),
              label: "Transaksi",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.notifications, color: BenpayPalette.darkBlue),
              icon: Icon(Icons.notifications, color: BenpayPalette.grey),
              label: "Notifikasi",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: BenpayPalette.darkBlue),
              icon: Icon(Icons.person, color: BenpayPalette.grey),
              label: "Akun",
            ),
          ],
        );
      },
    );
  }

  Widget _buildFloatingActionButton() => Transform.translate(
    offset: const Offset(0, -10),
    child: FloatingActionButton(
      elevation: 15.0,
      focusElevation: 2.0,
      autofocus: false,
      backgroundColor: BenpayPalette.darkBlue,
      child: const Icon(Icons.qr_code_scanner, color: BenpayPalette.white, size: 40),
      onPressed: () {
        // routePush(const QRPage());
        // CoreFunction.showToast("Segera datang", backgroundColor: BenpayPalette.green);
      }
    ),
  );
}
