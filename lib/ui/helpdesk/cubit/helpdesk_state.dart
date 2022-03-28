part of 'helpdesk_cubit.dart';

abstract class HelpdeskState extends Equatable {
  const HelpdeskState();

  @override
  List<Object> get props => [];
}

class HelpdeskInitial extends HelpdeskState {}

class HelpdeskLoaded extends HelpdeskState {

  final List<HelpDeskResponse> listData;

  const HelpdeskLoaded({
    required this.listData
  }); 
}

class HelpdeskLoading extends HelpdeskState {}
