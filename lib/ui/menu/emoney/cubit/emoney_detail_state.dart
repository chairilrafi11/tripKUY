part of 'emoney_detail_cubit.dart';

abstract class EmoneyDetailState extends Equatable {
  const EmoneyDetailState();

  @override
  List<Object> get props => [];
}

class EmoneyDetailInitial extends EmoneyDetailState {}

class EmoneyDetailLoaded extends EmoneyDetailState {

  final EmoneyProductResponse emoneyProductResponse;

  const EmoneyDetailLoaded({
    required this.emoneyProductResponse
  });
}

class EmoneyDetailLoading extends EmoneyDetailState {}

class EmoneyDetailEmpty extends EmoneyDetailState {}
