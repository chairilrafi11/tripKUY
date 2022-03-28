part of 'banner_cubit.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerLoaded extends BannerState {

  final List<BannerResponse> listBanner;
  final int curentDot;

  const BannerLoaded({
    required this.listBanner,
    this.curentDot = 0
  });

  @override
  List<Object> get props => [curentDot];

}

class BannerError extends BannerState {}

class BannerLoading extends BannerState {}
