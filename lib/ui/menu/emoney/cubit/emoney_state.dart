part of 'emoney_cubit.dart';

abstract class EmoneyState extends Equatable {
  const EmoneyState();

  @override
  List<Object> get props => [];
}

class EmoneyInitial extends EmoneyState {}

class EmoneyLoading extends EmoneyState {}

class EmoneyLoaded extends EmoneyState {

  final List<EmoneyProviderResponse> list;

  const EmoneyLoaded({
    required this.list
  });
}
