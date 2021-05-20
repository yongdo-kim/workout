import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';
import 'package:yd_workout_program/models/hiveModel/hive_user_item.dart';
import 'package:yd_workout_program/services/shop_service.dart';
import 'package:yd_workout_program/services/user_service.dart';
import 'package:yd_workout_program/untils/hive/hive_const.dart';
import 'package:yd_workout_program/untils/router/locator.dart';

class ShopViewModel extends ChangeNotifier {
  final UserService _userService = getIt<UserService>();
  final ShopService _shopService = getIt<ShopService>();
  final Logger _logger = getIt<Logger>();

  bool get isLoading => _isLoading;
  bool _isLoading = true;

  int get point => _point;
  int _point = 100;

  int get clickCount => _clickCount;
  int _clickCount = 0;

  bool get isPaid => _isPaid;
  bool _isPaid = false;

  bool get isWarning => _isWarning;
  bool _isWarning = false;

  String get boxImage => _boxImage;
  String _boxImage = "assets/images/box_open_01.png";

  String get newItemImageUrl => _newItemImageUrl;
  String _newItemImageUrl = "";

  String get newItemText => _newItemText;
  String _newItemText = "";

  String get collectPercentage => _collectPercentage;
  String _collectPercentage = "";

  int get userItemCollection => _userItemCollection;
  int _userItemCollection = 0;

  int get totalCollection => _totalCollection;
  int _totalCollection = 15;

  bool _canOpenBox = true;

  //광고
  late RewardedAd _rewardedAd;

  bool get rewardedReady => _rewardedReady;
  bool _rewardedReady = false;

  bool get isAdMobLoading => _isAdMobLoading;
  bool _isAdMobLoading = false;



  static final AdRequest request = AdRequest(
    testDevices: <String>['ca-app-pub-3940256099942544/5354046379'],
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  Future initialize() async {
    await showLoadingPage();
    await getItemCollection();
    getUserPoint();
    notifyListeners();
  }

  Future getItemCollection() async {
    var box = await Hive.openBox<UserItem>(USER_ITEM);
    if (box.isNotEmpty) {
      _userItemCollection = box.values.first.userItemList.length;
      _totalCollection = _shopService.itemMap.length;
      _collectPercentage =
          (_userItemCollection * 100 / _totalCollection).toStringAsFixed(1);
    } else {
      _totalCollection = _shopService.itemMap.length;
      _collectPercentage =
          (_userItemCollection * 100 / _totalCollection).toStringAsFixed(1);
    }
    notifyListeners();
  }

  void getUserPoint() {
    _point = _userService.point;
    notifyListeners();
  }

  void setPointWarning() {
    _isWarning = true;
    notifyListeners();
  }

  //이건 상자를 다 열고나서
  Future spendPoint() async {
    var tempPoint = _userService.point - 100;
    _userService.setPoint(tempPoint);
    await _userService.refreshUserData(); //saveData
    _logger.d('isPaid done');
    getUserPoint();
    notifyListeners();
  }

  Future addPoint() async {
    var tempPoint = _userService.point + 100;
    _userService.setPoint(tempPoint);
    await _userService.refreshUserData(); //saveData
    _logger.d('isPaid done');
    getUserPoint();
    notifyListeners();
  }

  void setPaidStatus() {
    _isPaid = !_isPaid;
    notifyListeners();
  }

  Future showAdMob() async{
    _isAdMobLoading = true;
    await _createRewardedAd();
    print("admob done");
    notifyListeners();
  }

  Future setCount() async {
    _clickCount += 1;
    if (_clickCount >= 1 && _clickCount <= 3) {
      _boxImage = "assets/images/box_open_02.png";
    }
    if (_clickCount >= 4 && _clickCount <= 6) {
      _boxImage = "assets/images/box_open_03.png";
    }
    if (_clickCount >= 7 && _clickCount <= 9) {
      _boxImage = "assets/images/box_open_04.png";
    }
    if (_clickCount >= 10 && _clickCount <= 12) {
      _boxImage = "assets/images/box_open_05.png";
    }
    if (_clickCount >= 13 && _clickCount <= 15) {
      _boxImage = "assets/images/box_open_06.png";
    }

    //테스트를 위해 16번 -> 1번
    if (_clickCount == 16) {
      _boxImage = "assets/images/box_animation.gif";
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 750)); //애니메이션

      if (_canOpenBox) {
        openBoxNotify(false);
        await spendPoint(); //포인트 소모,
        await getNewItem(); //새로운 아이템 얻기.
        //다이얼로그
        Get.dialog(
            Padding(
              padding:
                  EdgeInsets.only(top: 100, bottom: 100, left: 30, right: 30),
              child: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      _newItemImageUrl,
                      width: 200,
                      height: 200,
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          '축하드립니다!',
                          style: FontTheme.neoDgm18Medium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          "$_newItemText",
                          style: FontTheme.neoDgm18Medium
                              .apply(color: ColorTheme.mediumBlue),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          "(을)를 획득했어요!",
                          style: FontTheme.neoDgm18Medium,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: Get.back,
                          child: AutoSizeText(
                            '확인',
                            style: FontTheme.neoDgm18Medium
                                .apply(color: ColorTheme.boldBlue),
                          )),
                    )
                  ],
                ),
              ),
            ),
            barrierDismissible: false);
        //초기화하는 방식
        resetOpenBox();
        openBoxNotify(true);
      }
      await getItemCollection();
    }

    notifyListeners();
  }

  void openBoxNotify(bool value) {
    _canOpenBox = value;
    notifyListeners();
  }

  Future getNewItem() async {
    var userItemBox = await Hive.openBox<UserItem>(USER_ITEM);
    UserItem userItem = UserItem();

    Random random = Random();
    int getRandom = random.nextInt(15);

    // //무엇인가 얻었다면.
    if (userItemBox.isNotEmpty) {
      List<String> tempList = [];
      tempList = userItemBox.values.first.userItemList;

      var newItem = _shopService.itemMap.values.elementAt(getRandom);
      //중복된다면
      if (tempList.contains(newItem.imageUrl)) {
        while (true) {
          int oneMoreRandom = random.nextInt(15);
          newItem = _shopService.itemMap.values.elementAt(oneMoreRandom);
          if (!tempList.contains(newItem.imageUrl)) {
            break;
          }
        }
        _newItemImageUrl = newItem.imageUrl;
        _newItemText = newItem.title;
        tempList.add(_newItemImageUrl);
        userItem.userItemList = tempList;
        await userItemBox.putAt(0, userItem);
      }
      //중복되지 않는다면,
      else {
        _newItemImageUrl = newItem.imageUrl;
        _newItemText = newItem.title;
        tempList.add(newItem.imageUrl);
        userItem.userItemList = tempList;
        await userItemBox.putAt(0, userItem);
      }
    }
    //처음이라면
    else {
      Random random = Random();
      int getRandom = random.nextInt(15);
      _newItemImageUrl =
          _shopService.itemMap.values.elementAt(getRandom).imageUrl;
      _newItemText = _shopService.itemMap.values.elementAt(getRandom).title;
      userItem.userItemList = [];
      userItem.userItemList.add(_newItemImageUrl);
      await userItemBox.add(userItem);
    }
    notifyListeners();
  }

  void resetOpenBox() {
    setPaidStatus();
    _clickCount = 0;
    _boxImage = "assets/images/box_open_01.png";
  }

  Future showLoadingPage() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  Future _createRewardedAd() async {
    _rewardedAd = RewardedAd(
      adUnitId: RewardedAd.testAdUnitId,
      request: request,
      listener: AdListener(
          onAdLoaded: (Ad ad) {
            print('$RewardedAd loaded.');
            _rewardedReady = true;
            if (_rewardedReady) {
              _rewardedAd.show();
            }
            _rewardedReady = false;
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            print('$RewardedAd failed to load: $error');
            ad.dispose();
          },
          onAdOpened: (Ad ad) => print('$RewardedAd onAdOpened.'),
          onAdClosed: (Ad ad) {
            print('$RewardedAd closed.');
            ad.dispose();
            _isAdMobLoading=false;
            notifyListeners();
            //_createRewardedAd();
          },
          onApplicationExit: (Ad ad) => print('$RewardedAd onApplicationExit.'),
          // onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
          //   print('$RewardedAd with reward $RewardItem(${reward.amount}, ${reward.type})',
          //       addPoint();
          //   );
          // }
          onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
            print(
              '$RewardedAd with reward $RewardItem(${reward.amount}, ${reward.type})',
            );
            addPoint();
          }),
    )..load();
  }
}
