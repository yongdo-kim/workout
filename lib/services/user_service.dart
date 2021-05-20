import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yd_workout_program/models/hiveModel/hive_user.dart';
import 'package:yd_workout_program/models/hiveModel/hive_user_item.dart';
import 'package:yd_workout_program/untils/hive/hive_const.dart';
import 'package:yd_workout_program/untils/router/locator.dart';

@singleton
class UserService {
  final Logger _logger = getIt<Logger>();

  //포인트
  int get point => _point;
  int _point = 100;

  //오늘 목표
  int get todayGoal => _todayGoal;
  int _todayGoal = 30;

  //오늘셋트
  int get todaySet => _todaySet;
  int _todaySet = 3; //set default == 3

  //오늘 당 셋트
  List<int> get setPerQuantityList => _setPerQuantityList;
  List<int> _setPerQuantityList = [10, 10, 10];

  //내일 목표
  int get nextGoal => _nextGoal;
  int _nextGoal = 30;

  //휴식시간
  int get setRestTime => _setRestTime;
  int _setRestTime = 120;

  //바뀌는 시간
  int get setCurrentTime => _setCurrentTime;
  int _setCurrentTime = 120;

  //운동 단계
  String get setStartText => _setStartText;
  String _setStartText = "운동 하자!";

  //유저가 소유한 아이템 리스트
  List<String> get userItemList => _userItemList;
  List<String> _userItemList = [];

  //처음
  bool get isNew => _isNew;
  bool _isNew = true;

  Future initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNew = prefs.getBool('isNew') ?? true;
    await getUserData();
  }

  Future getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var box = await Hive.openBox<User>(USER_DATA);

    if (box.isNotEmpty) {
      //사용자가 써본적이 있다면,
      User user = box.values.first;
      _todayGoal = user.todayGoal;
      _todaySet = user.todaySet;
      _point = user.point;
      _nextGoal = user.nextGoal;
      _setPerQuantityList = user.setPerQuantityList;
      _setRestTime = user.setRestTime;
      ;
    }
    var itemBox = await Hive.openBox<UserItem>(USER_ITEM);
    if (itemBox.isNotEmpty) {
      //사용자가 써본적이 있다면,
      UserItem userItem = itemBox.values.first;
      _userItemList = userItem.userItemList;
    }
  }

  void changeCurrentTime(int value) {
    _setCurrentTime = value;
    print("UserService changeCurrentTime $_setCurrentTime");
  }

  void changeStartText(String value) {
    _setStartText = value;
  }

  void setPoint(int value) {
    _point = value;
  }

  Future setGoalSave({
    required int todayGoalValue,
    required int todaySetValue,
    required List<int> setPerQuantityListValue,
    required int nextGoalValue,
    required int setRestTimeValue,
  }) async {
    _todayGoal = todayGoalValue;
    _todaySet = todaySetValue;
    _setPerQuantityList = setPerQuantityListValue;
    _nextGoal = nextGoalValue;
    _setRestTime = setRestTimeValue;
    await refreshUserData();
  }

  Future refreshUserData() async {
    var box = await Hive.openBox<User>(USER_DATA);
    var user = User();
    user.todayGoal = _todayGoal;
    user.todaySet = _todaySet;
    user.setPerQuantityList = _setPerQuantityList;
    user.nextGoal = _nextGoal;
    user.setRestTime = _setRestTime;
    user.point = _point;


    if (box.length == 0) {
      box.add(user);
    } else {
      box.putAt(0, user);
    }
    _logger.d("UserService Hive Save refreshUserData Done");
  }
}
