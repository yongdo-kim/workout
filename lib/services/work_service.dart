import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:quiver/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yd_workout_program/models/hiveModel/hive_history.dart';
import 'package:yd_workout_program/services/user_service.dart';
import 'package:yd_workout_program/untils/hive/hive_const.dart';
import 'package:yd_workout_program/untils/router/locator.dart';

@singleton
class WorkOutService {
  final UserService _userService = getIt<UserService>();
  final Logger _logger = getIt<Logger>();

  //휴식시간
  int get setRestTime => _setRestTime;
  int _setRestTime = 120;

  //바뀌는 시간
  int get setCurrentTime => _setCurrentTime;
  int _setCurrentTime = 120;

  WorkOutService() {}

  Future saveHistory({
    required int todayGoalValue,
    required int todaySetValue,
    required List<int> setPerQuantityListValue,
    required int nextGoalValue,
    required int setRestTimeValue,
  }) async {
    var box = await Hive.openBox<History>(HISTORY_DATA);
    History history = History();
    history.todayGoal = todayGoalValue;
    history.todaySet = todaySetValue;
    history.setPerQuantityList = setPerQuantityListValue;
    history.nextGoal = nextGoalValue;
    history.setRestTime = setRestTimeValue;
    history.dateTIme = DateTime.now();
    box.add(history);

    _logger.d("saveHistory SuccessFully done");
  }
}
