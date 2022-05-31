import 'dart:convert';
import 'dart:io';

import 'package:fbroadcast_nullsafety/fbroadcast_nullsafety.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:chairil/core/database/box/notification/notification_box_controller.dart';
import 'package:chairil/core/notification/firebase_cloud_messaging.dart';
import 'package:chairil/core/util/util.dart';

import '../database/box/notification/notification_box.dart';

class FirebaseMessagingCore {
  static configFirebase() async {
    final firebaseMessaging = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        sound: true,
        provisional: true,
        criticalAlert: false,
        carPlay: true
      );
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      CoreFunction.logPrint("on Message Data", message.data.toString());
      CoreFunction.logPrint("on Message Notification", message.notification?.title);
      CoreFunction.logPrint("on Message Notification", message.notification?.body);
      showNotification(
        message,
        false,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      CoreFunction.logPrint("on launch notification", message.notification.toString());
      CoreFunction.logPrint("on launch data", message.data.toString());
      showNotification(message, true);
    });
  }

  static showNotification(RemoteMessage remoteMessage, bool fromOpened) {
    final FirebaseCloudMessaging _firebaseCloudMessaging = FirebaseCloudMessaging();
    if (fromOpened) {
      _firebaseCloudMessaging.onSelectNotification(jsonEncode(remoteMessage.data));
    } else {
      processNotification(
        remoteMessage,
        fromOpened,
      );
      CoreFunction.logPrint("onForegroundMessage", "onForegroundMessage");
      _firebaseCloudMessaging.showNotification(remoteMessage);
    }
  }

  static processNotification(RemoteMessage remoteMessage, bool fromOpened) async {

    NotificationBox notificationBox = NotificationBox.fromJson(remoteMessage.data);
    CoreFunction.logPrint('Response Notification', notificationBox.toJson());

    _broadcastNotificationData(remoteMessage);

    switch (notificationBox.notificationType?.toLowerCase()) {
      case CoreVariable.notificationTypeChat:
        break;
      case CoreVariable.notificationTypeOrder:
        await NotficationBoxController.save(notificationBox);
        _broadcastNotificationUpdateOrder(remoteMessage);
        break;
      case CoreVariable.notificationTypeTopUp:
      case CoreVariable.notificationTypeKYC:
      case CoreVariable.notificationTypePPOB:
      case CoreVariable.notificationTypeTransaction:
      case CoreVariable.notificationTypeTransfer:
      case CoreVariable.notificationTypePulsaAndEMoney:
      case CoreVariable.notificationClickActionWitdraw:
        await NotficationBoxController.save(notificationBox);
        break;
      case CoreVariable.notificationTypeInfo:
        await NotficationBoxController.save(notificationBox);
        // ComponentDialog.info(remoteMessage.notification!.title, remoteMessage.notification!.body, remoteMessage.data['image']);
        break;
      default:
        CoreFunction.logPrint('Response Notification', notificationBox.toJson());
        break;
    }
  }

  static void _broadcastNotificationData(RemoteMessage remoteMessage) {
    FBroadcast.instance()!.broadcast(
      CoreVariable.notificationBroadcast,
      value: remoteMessage.data,
    );
    CoreFunction.logPrint("Broadcast", "Notification");
  }

  static void _broadcastNotificationUpdateOrder(RemoteMessage remoteMessage) {
    FBroadcast.instance()!.broadcast(
      CoreVariable.notificationUpdateOrder,
      value: remoteMessage,
    );
  }

}

Future<dynamic> onBackgroundMessage(RemoteMessage remoteMessage) async {
  CoreFunction.logPrint("onBackgroundMessage", "onBackgroundMessage");
  await Firebase.initializeApp();
  // await EtekadDatabase.closeHive();
  //? TODO
  FirebaseMessagingCore.showNotification(remoteMessage, false);
}
