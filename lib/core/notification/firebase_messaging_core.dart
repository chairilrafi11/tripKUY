import 'dart:convert';
import 'dart:io';

import 'package:fbroadcast_nullsafety/fbroadcast_nullsafety.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pintupay/core/notification/firebase_cloud_messaging.dart';
import 'package:pintupay/core/util/util.dart';

import 'model/response_notification.dart';

class FirebaseMessagingCore {
  static configFirebase() async {
    final firebaseMessaging = FirebaseMessaging.instance;
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

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

    ResponseNotification responseNotification = ResponseNotification.fromJson(remoteMessage.data);
    // responseNotification.createdAtInMs = DateTime.now().millisecondsSinceEpoch.toString();
    CoreFunction.logPrint('Response Notication', responseNotification.toJson());
    CoreFunction.logPrint('responseNotification.notificationType', responseNotification.notificationType);

    switch (responseNotification.notificationType?.toLowerCase()) {
      case CoreVariable.notificationTypeChat:
        break;
      case CoreVariable.notificationTypeOrder:
        // await EtekadDatabase.saveNotification(
        //   responseNotification,
        //   EtekadUtilityBox.listNotification,
        // );

        _broadcastNotificationUpdateOrder(remoteMessage);
        break;
      case CoreVariable.notificationTypeTopUp:
      case CoreVariable.notificationTypeKYC:
      case CoreVariable.notificationTypePPOB:
      case CoreVariable.notificationTypeTransaction:
      case CoreVariable.notificationTypeTransfer:
      case CoreVariable.notificationTypePulsaAndEMoney:
      case CoreVariable.notificationClickActionWitdraw:
        //? TODO
        // await EtekadDatabase.saveNotification(
        //   responseNotification,
        //   EtekadUtilityBox.listNotification,
        // );
        _broadcastNotificationData(remoteMessage);
        break;
      case CoreVariable.notificationTypeInfo:
        //? TODO
        break;
      default:
        CoreFunction.logPrint('Response Notification', responseNotification.toJson());
        break;
    }
  }

  static void _broadcastNotificationData(RemoteMessage remoteMessage) {
    FBroadcast.instance()!.broadcast(
      CoreVariable.notificationBroadcast,
      value: remoteMessage.data,
    );
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
