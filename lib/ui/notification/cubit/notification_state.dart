part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  
  final List<NotificationBox> listNotification;

  const NotificationLoaded({
    required this.listNotification
  });
}

class NotificationEmpty extends NotificationState {}
