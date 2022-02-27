part of 'banner_cubit.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerLoaded extends BannerState {

  final List<BannerResponse> listBanner;

  const BannerLoaded({required this.listBanner});

  @override
  List<Object> get props => [listBanner];

}

class BannerError extends BannerState {}

class BannerLoading extends BannerState {}
