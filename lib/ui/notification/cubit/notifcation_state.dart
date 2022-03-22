part of 'notifcation_cubit.dart';

abstract class NotifcationState extends Equatable {
  const NotifcationState();

  @override
  List<Object> get props => [];
}

class NotifcationInitial extends NotifcationState {}

class NotifcationLoded extends NotifcationState {}

class NotifcationEmpty extends NotifcationState {}

class NotifcationLoading extends NotifcationState {}
