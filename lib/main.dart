import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logging/logging.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/core_function.dart';
import 'package:pintupay/ui/splashscreen/view/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';

import 'core/notification/firebase_cloud_messaging.dart';
import 'core/notification/firebase_messaging_core.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'pintupay_notification_channel',
  'pintupay',
  description: 'pintupay notification channel',
  importance: Importance.high,
);

Future<void> main() async {
  await init();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    runApp(const MyApp());
  // });
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

  await flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: false,
    badge: false,
    sound: false,
  );

  // var appDocumentDirectory = await getApplicationDocumentsDirectory();
  // Hive.initFlutter(appDocumentDirectory.path);
  // Hive.registerAdapter(UserBoxAdapter());
  // Hive.registerAdapter(OrderAdapter());
  // Hive.registerAdapter(ProductBoxAdapter());
  // Hive.registerAdapter(DiscountAdapter());
  // Hive.registerAdapter(AddressesAdapter());
  // Hive.registerAdapter(DataMenuAdapter());
  // Hive.registerAdapter(MerchantsAdapter());
  // Hive.registerAdapter(MenuResponseAdapter());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final FirebaseCloudMessaging firebaseCloudMessaging = FirebaseCloudMessaging();

  @override
  void initState() {
    _setupLogging();
    FirebaseMessagingCore.configFirebase();
    firebaseCloudMessaging.initializing();
    super.initState();
  }

  void _setupLogging() async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      CoreFunction.logPrint("", '${rec.level.name}: ${rec.time}; ${rec.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PintuPay',
      navigatorKey: navGK,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: PintuPayConstant.avenirRegular
      ),
      home: const SplashscreenView(),
    );
  }
}