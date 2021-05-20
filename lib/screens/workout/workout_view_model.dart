import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:quiver/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:yd_workout_program/models/hiveModel/hive_user.dart';
import 'package:yd_workout_program/services/user_service.dart';
import 'package:yd_workout_program/services/work_service.dart';
import 'package:yd_workout_program/untils/hive/hive_const.dart';
import 'package:yd_workout_program/untils/router/locator.dart';

//전면광고 : ca-app-pub-3940256099942544/1033173712
//보상형 전면광고 : ca-app-pub-3940256099942544/5354046379

class WorkOutViewModel extends ChangeNotifier {
  final Logger _logger = getIt<Logger>();
  final UserService _userService = getIt<UserService>();
  final WorkOutService _workOutService = getIt<WorkOutService>();

  // 오늘 목표
  int _todayGoal = 30;

  int get todayGoal => _todayGoal;
  String _totalGoalError = "";

  String get totalGoalError => _totalGoalError;

  // 오늘 셋트
  int _todaySet = 3; //set default == 3
  int get todaySet => _todaySet;

  //셋트 당 갯수
  List<int> get setPerQuantityList => _setPerQuantityList;
  List<int> _setPerQuantityList = [10, 10, 10];

  //셋트 당 갯수
  List<int> get nowPerQuantityList => _nowPerQuantityList;
  List<int> _nowPerQuantityList = [10, 10, 10];

  String _setPerError = "";

  String get setPerError => _setPerError;
  String _totalSetError = "";

  String get totalSetError => _totalSetError;

  // 내일 목표
  int _nextGoal = 30;

  int get nextGoal => _nextGoal;

  //시작버튼
  String _setStartText = "운동 하자!";

  String get setStartText => _setStartText;

  int _setRestTime = 120;

  int get setRestTime => _setRestTime;
  String _restTimeError = "";

  String get restTimeError => _restTimeError;

  int _setCurrentTime = 120;

  int get setCurrentTime => _setCurrentTime;

  //유저포인트
  int get point => _point;
  int _point = 0;

  //고양이 상태
  String get yellowCatStatus => _yellowCatStatus;
  String _yellowCatStatus = "assets/images/yellow_cat_basic_motion_ani.gif";

  //광고
  static final AdRequest request = AdRequest(
    testDevices: <String>['ca-app-pub-2398130378795170/1636177738'],
  );
  late InterstitialAd _interstitialAd;
  bool _interstitialReady = false;

  Future initialize() async {
    _logger.d("WorkOutViewModel initialize");
    await _userService.getUserData();
    await getUserData();
    // _createInterstitialAd();
  }

  void _createInterstitialAd() {
    _interstitialAd = InterstitialAd(
      adUnitId: 'ca-app-pub-2398130378795170/1636177738',
      request: request,
      listener: AdListener(
        onAdLoaded: (Ad ad) {
          print('$InterstitialAd loaded.');
          _interstitialReady = true;
          if (_interstitialReady) {
            _interstitialAd.show();
          }
          _interstitialReady = false;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$InterstitialAd failed to load: $error.');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$InterstitialAd onAdOpened.'),
        onAdClosed: (Ad ad) {
          print('$InterstitialAd closed.');
          ad.dispose();
          //_createInterstitialAd();
        },
        onApplicationExit: (Ad ad) =>
            print('$InterstitialAd onApplicationExit.'),
      ),
    )..load();
  }

  Future getUserData() async {
    _todayGoal = _userService.todayGoal;
    _todaySet = _userService.todaySet;
    _point = _userService.point;
    _nextGoal = _userService.nextGoal;
    _setPerQuantityList = _userService.setPerQuantityList;
    _setRestTime = _userService.setRestTime;
    _setStartText = _userService.setStartText;
    _setCurrentTime = _userService.setCurrentTime;
    if (_setStartText == "휴식 중...") {
      restTimer(goToAnotherPage: true);
    }

    notifyListeners();
  }

  void increaseTotalGoal() {
    if (_todayGoal > 74) {
      _totalGoalError = "* 75개를 초과할 수 없어요";
      notifyListeners();
      return;
    }
    _totalGoalError = "";
    _todayGoal = _todayGoal + 1;

    perQuantity();
    notifyListeners();
  }

  void decreaseTotalGoal() {
    if (_todayGoal < 31) {
      _totalGoalError = "* 30개 미만으로 내려갈 수 없어요";
      notifyListeners();
      return;
    }

    _todayGoal = _todayGoal - 1;
    _totalGoalError = "";
    perQuantity();
    notifyListeners();
  }

  void increaseTodaySet() {
    if (_todaySet <= 1 || _todaySet >= 13) {
      _totalSetError = "최소 2세트 이상 최대 13세트 이하가 좋아요";
    } else {
      _totalSetError = "";
    }

    if (_todaySet >= 13) {
      return;
    }

    _todaySet = _todaySet + 1;
    perQuantity();
    notifyListeners();
  }

  void decreaseTotalSet() {
    if (_todaySet <= 2 || _todaySet >= 13) {
      _totalSetError = "최소 2세트 이상 최대 13세트 이하가 좋아요";
    } else {
      _totalSetError = "";
    }

    if (_todaySet <= 2) {
      return;
    }

    _todaySet = _todaySet - 1;
    _totalSetError = "";
    perQuantity();
    notifyListeners();
  }

  Future perQuantity({int? newGoal, int? newSet}) async {
    var goal = newGoal ?? _todayGoal;
    var set = newSet ?? _todaySet;

    var share = (goal / set).floor();
    var rest = goal % set;

    if (share <= 5 || share >= 16) {
      _setPerError = "* 한 셋트당 6회 이상 15회 이하가 좋아요";
      notifyListeners();
    } else {
      _setPerError = "";
      notifyListeners();
    }

    if (rest == 0) {
      _setPerQuantityList.clear();
      for (int i = 0; i < set; i++) {
        _setPerQuantityList.add(share);
      }
    } else {
      _setPerQuantityList.clear();
      for (int i = 0; i < set; i++) {
        _setPerQuantityList.add(share);
      }
      for (int i = set - 1; i >= 0; i--) {
        if (rest <= 0) {
          return;
        } else {
          _setPerQuantityList[i] = _setPerQuantityList[i] + 1;
          rest--;
        }
      }
    }
  }

  Future todayPerQuantity({int? newGoal, int? newSet}) async {
    var goal = newGoal ?? _todayGoal;
    var set = newSet ?? _todaySet;

    var share = (goal / set).floor();
    var rest = goal % set;

    if (share <= 5 || share >= 16) {
      _setPerError = "* 한 셋트당 6회 이상 15회 이하가 좋아요";
      notifyListeners();
    } else {
      _setPerError = "";
      notifyListeners();
    }

    if (rest == 0) {
      _nowPerQuantityList.clear();
      for (int i = 0; i < set; i++) {
        _nowPerQuantityList.add(share);
      }
    } else {
      _nowPerQuantityList.clear();
      for (int i = 0; i < set; i++) {
        _nowPerQuantityList.add(share);
      }
      for (int i = set - 1; i >= 0; i--) {
        if (rest <= 0) {
          return;
        } else {
          _nowPerQuantityList[i] = _nowPerQuantityList[i] + 1;
          rest--;
        }
      }
    }
  }

  void increaseRestTime() {
    if (_setRestTime > 170) {
      _restTimeError = "쉬는 시간은 180초 이내가 좋아요";
      return;
    }
    _restTimeError = "";
    _setRestTime = _setRestTime + 10;
    notifyListeners();
  }

  void decreaseRestTime() {
    if (_setRestTime < 20) {
      _restTimeError = "쉬는 시간은 120초 이상 좋아요";
      return;
    }
    _restTimeError = "";
    _setRestTime = _setRestTime - 10;
    print(_setRestTime);
    notifyListeners();
  }

  //다이얼로구
  void dialogApply() {
    _userService.setGoalSave(
        todayGoalValue: _todayGoal,
        todaySetValue: _todaySet,
        setPerQuantityListValue: _setPerQuantityList,
        nextGoalValue: _nextGoal,
        setRestTimeValue: _setRestTime);
    Get.back();
    //서비스단에 올린 뒤에, 서비스 단에서 저장하도록 설정.
  }

  void startButton() {
    _logger.d("_setStartText started $_setStartText");

    if (_setStartText == "운동 하자!") {
      _setStartText = "휴식 하자!";
      _userService.changeStartText(_setStartText);
      _yellowCatStatus = "assets/images/yellow_cat_workout_motion.gif";
      notifyListeners();
      return;
    }

    if (_setStartText == "휴식 하자!") {
      _setStartText = "휴식 중...";
      _userService.changeStartText(_setStartText);
      _yellowCatStatus = "assets/images/yellow_cat_rest_motion_ani.gif";
      restTimer(goToAnotherPage: false);
      notifyListeners();
      return;
    }

    notifyListeners();
  }

  void restTimer({required bool goToAnotherPage}) {
    _logger.d("restTimer started");

    if (!goToAnotherPage) {
      _setCurrentTime = _setRestTime;
    }
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _setCurrentTime), //변화하는 시간
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      _setCurrentTime = _setCurrentTime - 1;
      _userService.changeCurrentTime(_setCurrentTime);
      print("_setCurrentTime" + _setCurrentTime.toString());
      notifyListeners();
    });

    sub.onDone(() {
      _logger.d("restTimer Done");
      sub.cancel();
      Vibration.vibrate(duration: 1000, amplitude: 255);
      restPerSet();
      perSetDone();
    });
  }

  Future restPerSet() async {
    var box = await Hive.openBox<User>(USER_DATA);
    var user = box.values.first;
    _userService.changeStartText("운동 하자!");
    _setStartText = "운동 하자!";
    _setCurrentTime = user.setRestTime;
    _yellowCatStatus = "assets/images/yellow_cat_basic_motion_ani.gif";
    notifyListeners();
  }

  Future perSetDone() async {
    //하나의 타이머가 종료되었을 경우
    if (_setPerQuantityList.length == 1) {
      _setPerQuantityList.removeAt(0);
      _logger.d("모든 운동 종료");
      _userService.setPoint(_point + 100);
      await nextWorkOut();

      /// 광고보기 ///
      //광고가 켜진 이후에는 포인트 가산
    } else {
      _setPerQuantityList.removeAt(0);
    }

    notifyListeners();
  }

  Future nextWorkOut() async {
    todayPerQuantity();

    //일지저장
    await _workOutService.saveHistory(
        todayGoalValue: _todayGoal,
        todaySetValue: _todaySet,
        setPerQuantityListValue: _nowPerQuantityList,
        nextGoalValue: _todayGoal + 1,
        setRestTimeValue: _setRestTime);
    notifyListeners();

    //다음에 바뀔 셋트 당 수 변환 저장.
    perQuantity(newGoal: _todayGoal + 1, newSet: _todaySet);
    notifyListeners();

    //유저데이터 저장
    await _userService.setGoalSave(
        todayGoalValue: _todayGoal + 1,
        todaySetValue: _todaySet,
        setPerQuantityListValue: _setPerQuantityList,
        nextGoalValue: _todayGoal + 2,
        setRestTimeValue: _setRestTime);
    await initialize();

    print("_interstitialReady" + _interstitialReady.toString());

    _createInterstitialAd();
    notifyListeners();
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    super.dispose();
  }
}
