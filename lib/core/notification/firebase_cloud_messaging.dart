import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:chairil/core/util/util.dart';

import '../database/box/notification/notification_box.dart';

class FirebaseCloudMessaging {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initializing() async {
    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('@mipmap/launcher_icon');

    IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings, 
      iOS: iosInitializationSettings
    );

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  Future<dynamic> showNotification(RemoteMessage remoteMessage, {String payload = ""}) async {

    //? Set Notification Variabel
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/launcher_icon');

    IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, 
      iOS: initializationSettingsIOS
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings, 
      onSelectNotification: onSelectNotification
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'chairil_notification_channel',
      'chairil',
      channelDescription: 'chairil notification channel',
      importance: Importance.high,
      fullScreenIntent: false,
      visibility: NotificationVisibility.public,
      setAsGroupSummary: true,
      showWhen: true,
      priority: Priority.high,
      ticker: 'ticker',
      channelShowBadge: true,
      enableLights: true,
      // sound: RawResourceAndroidNotificationSound('notif'),
      enableVibration: true,
      // vibrationPattern: Int64List.fromList([0, 500, 100, 150, 50, 150, 50, 500]),
      groupKey: 'chairil',
      autoCancel: true,
      playSound: true,
    );

    IOSNotificationDetails iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentBadge: true,
      presentAlert: true,
      // sound: 'assets/sounds/notif_sound.wav',
      presentSound: true
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    if (
      remoteMessage.notification != null &&
      remoteMessage.notification?.title != null &&
      (remoteMessage.notification?.title?.isNotEmpty ?? false) &&
      remoteMessage.notification?.body != null &&
      (remoteMessage.notification?.body?.isNotEmpty ?? false)
    ) {
      await flutterLocalNotificationsPlugin.show(
        1,
        remoteMessage.notification?.title,
        remoteMessage.notification?.body,
        platformChannelSpecifics,
        payload: jsonEncode(remoteMessage.data),
      );
    } else {
      await flutterLocalNotificationsPlugin.show(
        1,
        remoteMessage.data['data_title'],
        remoteMessage.data['data_body'],
        platformChannelSpecifics,
        payload: jsonEncode(remoteMessage.data)
      );
    }
  }

  Future onSelectNotification(String? payLoad) async {
    if (payLoad != null) {
      CoreFunction.logPrint("PayLoad fcm", payLoad);

      Map<String, dynamic> map = jsonDecode(payLoad);

      CoreFunction.logPrint("PayLoad map", map);

      NotificationBox notificationBox = NotificationBox.fromJson(map);

      switch (notificationBox.clickAction?.toUpperCase()) {
        case CoreVariable.notificationClickActionChat:
          break;
        case CoreVariable.notificationClickActionOrder:
        case CoreVariable.notificationClickActionTransaction:
        case CoreVariable.notificationClickActionPPOB:
        case CoreVariable.notificationClickActionEMoney:
        case CoreVariable.notificationClickActionPulsa:
        case CoreVariable.notificationClickActionTopUp:
        case CoreVariable.notificationClickActionTransfer:
        case CoreVariable.notificationClickActionWitdraw:
          // pushAndRemoveUntil(
          //   Dashboard(page: 1,),
          //   RouterType.cupertino,
          // );
          break;
        case CoreVariable.notificationClickActionInfo:
          // pushAndRemoveUntil(
          //   BlocProvider(
          //     create: (_) => NotificationCubit(),
          //     child: const NotificationPage(),
          //   ),
          //   RouterType.cupertino,
          // );
          break;
          // routePush(
          //   const MutationPage(),
          //   RouterType.cupertino,
          // );
          // break;
        default:
          CoreFunction.logPrint('Payload', jsonEncode(notificationBox));
          break;
      }
    }
  }

  Future onDidReceiveLocalNotification(int? id, String? title, String? body, String? payload) async {
    return CupertinoAlertDialog(
      title: Text(title ?? ""),
      content: Text(body ?? ""),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            debugPrint("");
          },
          child: const Text("Okay")
        ),
      ],
    );
  }

  Future showNotificationInfo({infoDataBody, infoDataClick, infoDataTitle}) async {}
}
