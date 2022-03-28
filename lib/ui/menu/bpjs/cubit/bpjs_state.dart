part of 'bpjs_cubit.dart';

abstract class BpjsState extends Equatable {
  const BpjsState();

  @override
  List<Object> get props => [];
}

class BpjsInitial extends BpjsState {}

class BpjsLoading extends BpjsState {}

class BpjsRecentNumber extends BpjsState {

  final List<RecentNumberResponse> listRecent;

  const BpjsRecentNumber({
    required this.listRecent
  });

  @override
  List<Object> get props => [listRecent];

}
