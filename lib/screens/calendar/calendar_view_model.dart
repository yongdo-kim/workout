import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:yd_workout_program/models/hiveModel/hive_history.dart';
import 'package:yd_workout_program/untils/hive/hive_const.dart';
import 'package:yd_workout_program/untils/router/locator.dart';

class CalendarViewModel extends ChangeNotifier {
  final Logger _logger = getIt<Logger>();

  DateTime get today => _today;
  DateTime _today = DateTime.now();

  List<HistoryData> get totalHistoryList => _totalHistoryList;
  List<HistoryData> _totalHistoryList = [];

  List<HistoryData> get monthHistoryList => _monthHistoryList;
  List<HistoryData> _monthHistoryList = [];

  CalendarViewModel() {}

  Future initialize() async {
    await loadTotalHistory();
    await loadMonthHistory();
    notifyListeners();
  }

  void moveNextMonth() {
    _today = DateTime(_today.year, _today.month + 1, _today.day);
    loadMonthHistory(setDate: _today);
    notifyListeners();
  }

  void movePrevMonth() {
    _today = DateTime(_today.year, _today.month - 1, _today.day);
    loadMonthHistory(setDate: _today);
    notifyListeners();
  }

  Future loadMonthHistory({DateTime? setDate}) async {
    if (setDate == null) {
      setDate = _today;
    }
    var tempList = _totalHistoryList
        .where((e) => ((e.dateTime.month == (setDate!.month)) &&
            (e.dateTime.year == (setDate.year))))
        .toList();
    _monthHistoryList = tempList;
    notifyListeners();
  }

  bool isSameDay({required DateTime value, required DateTime today}) {
    if ((value.month == today.month) && (value.year == today.year)) {
      return true;
    } else {
      return false;
    }
  }

  Future loadTotalHistory() async {
    var box = await Hive.openBox<History>(HISTORY_DATA);
    _totalHistoryList.clear();
    if (box.isNotEmpty) {
      box.values.forEach((e) {
        _totalHistoryList.add(HistoryData(
          dateTime: e.dateTIme,
          todayGoal: e.todayGoal,
          setPerQuantityList: e.setPerQuantityList,
          nextGoal: e.nextGoal,
          setRestTime: e.setRestTime,
          todaySet: e.todaySet,
        ));
      });
    }
    print("box.values.length" + box.values.length.toString());
    _totalHistoryList.forEach((element) {
      element.setPerQuantityList.forEach((element) {
        print("loadTotalHistory" + element.toString());
      });
    });
  }
}

class HistoryData {
  final DateTime dateTime;
  final int todayGoal;
  final List<int> setPerQuantityList;
  final int nextGoal;
  final int setRestTime;
  final int todaySet;


  HistoryData(
      {required this.dateTime,
      required this.todayGoal,
      required this.setPerQuantityList,
      required this.nextGoal,
      required this.setRestTime,
      required this.todaySet,
      });
}
