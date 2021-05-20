import 'package:get/get.dart';
import 'package:yd_workout_program/screens/calendar/calendar_view.dart';
import 'package:yd_workout_program/screens/intro/intro_view.dart';
import 'package:yd_workout_program/screens/question/question_view.dart';
import 'package:yd_workout_program/screens/shop/shop_view.dart';
import 'package:yd_workout_program/screens/storage/storage_view.dart';
import 'package:yd_workout_program/screens/workout/workout_view.dart';

class RouterList {
  static List<GetPage<dynamic>> routerList = [
    // GetPage(
    //   name: '/',
    //   page: () => QuestionView(),
    // ),
    GetPage(
      name: '/work_out_route',
      page: () => WorkOutView(),
    ),
    GetPage(
      name: '/calendar_route',
      page: () => CalendarView(),
    ),
    GetPage(
      name: '/show_route',
      page: () => ShopView(),
    ),
    GetPage(
      name: '/storage_route',
      page: () => StorageView(),
    ),//IntroView
    GetPage(
      name: '/intro_route',
      page: () => IntroView(),
    ),//IntroView
  ];
}