import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/helpdesk_response.dart';
import '../provider/helpdesk_provider.dart';

part 'helpdesk_state.dart';

class HelpdeskCubit extends Cubit<HelpdeskState> {
  HelpdeskCubit() : super(HelpdeskLoading()){
    fetchData();
  }

  Future fetchData() async {
   emit(HelpdeskLoaded(listData: await HelpdeskProvider.fetchData())); 
  }
}
