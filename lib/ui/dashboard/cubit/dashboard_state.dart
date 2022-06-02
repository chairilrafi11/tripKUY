part of 'dashboard_cubit.dart';

enum NavBarItem { place, tourguide }

class DashboardState extends Equatable {

  final NavBarItem navBarItem;

  const DashboardState({required this.navBarItem});

  @override
  List<Object> get props => [navBarItem];
}
