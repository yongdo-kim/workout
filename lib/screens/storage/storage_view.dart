import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'storage_view_model.dart';

class StorageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StorageViewModel>.reactive(
      viewModelBuilder: () => StorageViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            /// 전체배경 레이어

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.yellow,
              child: Image.asset(
                "assets/images/my_room_background.png",
                fit: BoxFit.cover,
              ),
            ),
            /// 가게 레이어
            initFlexLayer(
                model: model,
                name: "assets/images/shop_big.png",
                cWidth: 160,
                cHeight: 180,
                colTop: 1,
                colDown: 3,
                rowLeft: 1,
                rowRight: 2),

            /// 아이템 레이어
            initFlexLayer(
                model: model,
                name: "assets/images/box_open_01.png",
                cWidth: 60,
                cHeight: 60,
                colTop: 3,
                colDown: 3,
                rowLeft: 6,
                rowRight: 4),
            initFlexLayer(
                model: model,
                name: "assets/images/yellow_cat_workout_motion.gif",
                cWidth: 90,
                cHeight: 90,
                colTop: 6,
                colDown: 1,
                rowLeft: 2,
                rowRight: 4),
            flexLayer(
                model: model,
                name: 'workoutBagPack',
                cWidth: 70,
                cHeight: 60,
                colTop: 6,
                colDown: 5,
                rowLeft: 2,
                rowRight: 4),
            flexLayer(
                model: model,
                name: 'yogaMat_01',
                cWidth: 100,
                cHeight: 70,
                colTop: 4,
                colDown: 1,
                rowLeft: 1,
                rowRight: 0),
            flexLayer(
                model: model,
                name: 'yogaMat_02',
                cWidth: 100,
                cHeight: 70,
                colTop: 4,
                colDown: 3,
                rowLeft: 1,
                rowRight: 0),
            flexLayer(
                model: model,
                name: 'protein_01',
                cWidth: 50,
                cHeight: 60,
                colTop: 1,
                colDown: 0,
                rowLeft: 13,
                rowRight: 1),
            flexLayer(
                model: model,
                name: 'protein_02',
                cWidth: 50,
                cHeight: 60,
                colTop: 1,
                colDown: 0,
                rowLeft: 13,
                rowRight: 5),
            flexLayer(
                model: model,
                name: 'workoutAppleWatch',
                cWidth: 30,
                cHeight: 50,
                colTop: 4,
                colDown: 1,
                rowLeft: 1,
                rowRight: 14),
            flexLayer(
                model: model,
                name: 'workoutPinkDumbbell',
                cWidth: 50,
                cHeight: 50,
                colTop: 8,
                colDown: 1,
                rowLeft: 1,
                rowRight: 20),
            flexLayer(
                model: model,
                name: 'workoutSandal',
                cWidth: 50,
                cHeight: 60,
                colTop: 30,
                colDown: 1,
                rowLeft: 1,
                rowRight: 15),

            /// 고양이 레이어
            flexLayer(
                model: model,
                name: 'yellowCatBasicMotionAni',
                cWidth: 90,
                cHeight: 90,
                colTop: 1,
                colDown: 1,
                rowLeft: 1,
                rowRight: 15),
            flexLayer(
                model: model,
                name: 'kettlebell_01',
                cWidth: 40,
                cHeight: 40,
                colTop: 7,
                colDown: 5,
                rowLeft: 1,
                rowRight: 10),
            flexLayer(
                model: model,
                name: "greyCatRestMotionAni",
                cWidth: 50,
                cHeight: 90,
                colTop: 2,
                colDown: 3,
                rowLeft: 6,
                rowRight: 4),
            flexLayer(
                model: model,
                name: 'greyCatBasicMotionAni',
                cWidth: 70,
                cHeight: 90,
                colTop: 3,
                colDown: 1,
                rowLeft: 9,
                rowRight: 1),
            flexLayer(
                model: model,
                name: 'yellowCatRestMotionAni',
                cWidth: 50,
                cHeight: 90,
                colTop: 4,
                colDown: 4,
                rowLeft: 14,
                rowRight: 2),
            flexLayer(
                model: model,
                name: 'greyCatWorkoutMotionAni',
                cWidth: 110,
                cHeight: 110,
                colTop: 3,
                colDown: 1,
                rowLeft: 1,
                rowRight: 1),
          ],
        )),
      ),
    );
  }
}

Widget flexLayer(
    {int? colTop,
    int? colDown,
    int? rowLeft,
    int? rowRight,
    double? cWidth,
    double? cHeight,
    required StorageViewModel model,
    required String name}) {
  return Column(
    children: [
      Flexible(flex: colTop ?? 1, child: Container()),
      Row(
        children: [
          Flexible(flex: rowLeft ?? 1, child: Container()),
          Visibility(
            visible: model.itemMap[name]?.isShowing ?? false,
            child: Image.asset(
              model.itemMap[name]?.imageUrl ?? "assets/images/help_mark.png",
              width: cWidth ?? 40,
              height: cHeight ?? 40,
              fit: BoxFit.fill,
            ),
          ),
          Flexible(flex: rowRight ?? 2, child: Container()),
        ],
      ),
      Flexible(flex: colDown ?? 1, child: Container()),
    ],
  );
}

Widget initFlexLayer(
    {int? colTop,
    int? colDown,
    int? rowLeft,
    int? rowRight,
    double? cWidth,
    double? cHeight,
    bool? isInit,
    required StorageViewModel model,
    required String name}) {
  return Column(
    children: [
      Flexible(flex: colTop ?? 1, child: Container()),
      Row(
        children: [
          Flexible(flex: rowLeft ?? 1, child: Container()),
          Image.asset(
            name,
            width: cWidth ?? 160,
            height: cHeight ?? 180,
          ),
          Flexible(flex: rowRight ?? 2, child: Container()),
        ],
      ),
      Flexible(flex: colDown ?? 1, child: Container()),
    ],
  );
}
