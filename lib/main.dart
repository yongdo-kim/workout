import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yd_workout_program/screens/home/home_view.dart';
import 'package:yd_workout_program/screens/intro/intro_view.dart';
import 'package:yd_workout_program/services/shop_service.dart';
import 'package:yd_workout_program/services/user_service.dart';
import 'package:yd_workout_program/untils/hive/init_hive.dart';
import 'package:yd_workout_program/untils/router/locator.dart';
import 'package:yd_workout_program/untils/router/router_list.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //오직 세로

  await initHive();
  configureDependencies();

  //처음유저 체크
  final UserService _userService = getIt<UserService>();
  final ShopService _shopService = getIt<ShopService>();

  await _userService.initialize();
  await _shopService.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserService _userService = getIt<UserService>();

  late String _token;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('FirebaseMessaging.instance');
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        print('android noti here');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Workout Cat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _userService.isNew ? IntroView() : HomeView(),
      getPages: RouterList.routerList,
    );
    //GetMaterialApp
  }
}
