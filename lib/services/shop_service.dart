import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:yd_workout_program/models/hiveModel/hive_user_item.dart';
import 'package:yd_workout_program/untils/hive/hive_const.dart';

// 전체적 데이터 소유
@singleton
class ShopService {
  Map<String, ItemStatus> get itemMap => _itemMap;
  Map<String, ItemStatus> _itemMap = {};

  ShopService() {
    _itemMap = {
      //구매해야할 것들
      'yellowCatBasicMotionAni': ItemStatus(
          "assets/images/yellow_cat_basic_motion_ani.gif",
          false,
          "멀뚱멀뚱 노란 고양이"),
      'yellowCatRestMotionAni': ItemStatus(
          "assets/images/yellow_cat_rest_motion_ani.gif", false, "충전하는 노란 고양이"),
      'kettlebell_01':
          ItemStatus("assets/images/kettlebell_01.png", false, "무거운 노란 케틀벨"),
      'kettlebell_02':
          ItemStatus("assets/images/kettlebell_02.png", false, "빛나는 초록 케틀벨"),
      'greyCatBasicMotionAni': ItemStatus(
          "assets/images/grey_cat_basic_motion_ani.gif", false, "멍때리는 회색 고양이"),
      'greyCatRestMotionAni': ItemStatus(
          "assets/images/grey_cat_rest_motion_ani.gif", false, "잠자는 회색 고양이"),
      'greyCatWorkoutMotionAni': ItemStatus(
          "assets/images/grey_cat_workout_motion_ani.gif",
          false,
          "역도하는 회색 고양이"),
      'protein_01':
          ItemStatus("assets/images/protein_01.png", false, "가성비의 빨간 프로틴"),
      'protein_02':
          ItemStatus("assets/images/protein_02.png", false, "비싼 주황 프로틴"),
      'workoutAppleWatch': ItemStatus(
          "assets/images/workout_apple_watch.png", false, "나만 없는 애플워치"),
      'workoutBagPack':
          ItemStatus("assets/images/workout_bagpack.png", false, "모든지 담는 백팩"),
      'workoutPinkDumbbell': ItemStatus(
          "assets/images/workout_pink_dumble.png", false, "1.5kg 핑크덤벨"),
      'workoutSandal':
          ItemStatus("assets/images/workout_sandle.png", false, "민첩한 운동화"),
      'yogaMat_01':
          ItemStatus("assets/images/yogarmat_01.png", false, "유연성을 위한 연두 요가매트"),
      'yogaMat_02': ItemStatus(
          "assets/images/yogarmat_02.png", false, "스트레칭을 위한 빨간 요가메트"),
    };

    // print(_itemMap.length); //15개
  }

  Future initialize() async {
    await getUserItem();
  }

  Future getUserItem() async {
    var userItemBox = await Hive.openBox<UserItem>(USER_ITEM);
    if (userItemBox.isNotEmpty) {
      var tempList = userItemBox.values.first.userItemList;
      tempList.forEach((element) {
        _itemMap.forEach((key, value) {
          if (element == value.imageUrl) {
            value.isShowing = true;
          }
        });
      });
    }
  }
}

class ItemStatus {
  final String imageUrl;
  final String title;
  bool isShowing;

  ItemStatus(this.imageUrl, this.isShowing, this.title);
}
