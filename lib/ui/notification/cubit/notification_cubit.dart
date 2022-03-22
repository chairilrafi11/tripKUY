import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/database/box/notification/notification_box.dart';
import 'package:pintupay/core/database/box/notification/notification_box_controller.dart';

import '../../component/component_dialog.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()){
    loadData();
  }

  Future loadData() async {
    List<NotificationBox> listNotification = await NotficationBoxController.load();
    if(listNotification.isNotEmpty) {
      emit(NotificationLoaded(listNotification: listNotification));
    } else {
      emit(NotificationEmpty());
    }
  }

  void showDialog(NotificationBox notificationBox) => ComponentDialog.info(
    notificationBox.dataTitle, 
    notificationBox.dataBody, 
    notificationBox.dataImage
  );
}
