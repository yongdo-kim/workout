// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:yd_workout_program/screens/home/home_view.dart';
// import 'package:yd_workout_program/untils/router/locator.dart';
//
// class QuestionViewModel extends ChangeNotifier {
//   bool get isFirstDone => _isFirstDone;
//   bool _isFirstDone = false;
//
//   bool get isSecondShow => _isSecondShow;
//   bool _isSecondShow = false;
//
//   bool get hasSaveData => _hasSaveData;
//   bool _hasSaveData = false;
//
//   Future initialize(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var checkSave = prefs.getString("workType");
//     if (checkSave != null) {
//       await goToHomeView();
//     }
//     notifyListeners();
//   }
//
//   Future firstDone() async {
//     _isFirstDone = true;
//     Future.delayed(Duration(milliseconds: 1000), () {
//       _isSecondShow = true;
//       notifyListeners();
//     });
//
//     notifyListeners();
//   }
//
//   Future saveWorkType(String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("workType", value);
//     await goToHomeView();
//   }
//
//   Future goToHomeView() async {
//     await Get.to(() => HomeView());
//   }
// }
