part of 'tv_cubit.dart';

abstract class TvState extends Equatable {
  const TvState();

  @override
  List<Object> get props => [];
}

class TvInitial extends TvState {}

class TvLoading extends TvState {}

class TvLoaded extends TvState {

  final List<TvProductResponse> listProduct;
  final TvProductResponse product;

  const TvLoaded({
    required this.listProduct,
    required this.product
  });

  @override
  List<Object> get props => [listProduct, product];
}
