import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yd_workout_program/screens/home/home_view.dart';
import 'package:yd_workout_program/untils/router/locator.dart';

class IntroViewModel extends ChangeNotifier {


  Future initialize(BuildContext context) async {

  }

  Future goToHomeView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isNew', false);
    await Get.to(() => HomeView());
  }
}
