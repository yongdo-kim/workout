import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';
import 'package:yd_workout_program/screens/intro/intro_view.dart';
import 'package:yd_workout_program/screens/workout/workout_view_model.dart';

class SettingWidget extends ViewModelWidget<WorkOutViewModel> {
  @override
  Widget build(BuildContext context, WorkOutViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => _setting(context, model)),
              IconButton(
                  icon: Image.asset(
                    "assets/images/help_mark.png",
                    width: 60,
                    height: 60,
                  ),
                  onPressed: () => _infoHypertrophy(context)),
            ],
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: ColorTheme.boldBlue, width: 2.0),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: AutoSizeText(
                      "${model.point} p",
                      style: FontTheme.neoDgm20Regular,
                    ))),
          ),
        ],
      ),
    );
  }
}

_setting(BuildContext context, WorkOutViewModel model) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => StatefulBuilder(builder: (context, setState) {
            return Dialog(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      AutoSizeText(
                        "오늘 총 목표 개수",
                        style:
                            FontTheme.neoDgm20Medium.apply(color: Colors.black),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                setState(() {
                                  model.decreaseTotalGoal();
                                });
                              }),
                          AutoSizeText(
                            model.todayGoal.toString(),
                            style: FontTheme.neoDgm20Medium
                                .apply(color: ColorTheme.boldBlue),
                            maxLines: 1,
                          ),
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              onPressed: () {
                                setState(() {
                                  model.increaseTotalGoal();
                                });
                              })
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          model.totalGoalError,
                          style: FontTheme.neoDgm13Regular
                              .apply(color: Colors.black),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AutoSizeText(
                        "반복 셋트 수",
                        style:
                            FontTheme.neoDgm20Medium.apply(color: Colors.black),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                setState(() {
                                  model.decreaseTotalSet();
                                });
                              }),
                          AutoSizeText(
                            model.todaySet.toString(),
                            style: FontTheme.neoDgm20Medium
                                .apply(color: ColorTheme.boldBlue),
                            maxLines: 1,
                          ),
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              onPressed: () {
                                setState(() {
                                  model.increaseTodaySet();
                                });
                              })
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          model.totalSetError,
                          style: FontTheme.neoDgm13Regular
                              .apply(color: Colors.black),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: [
                              Column(
                                children: [
                                  AutoSizeText(
                                    "오늘 목표",
                                    style: FontTheme.neoDgm13Medium
                                        .apply(color: Colors.black),
                                  ),
                                  SizedBox(height: 10),
                                  AutoSizeText(model.todayGoal.toString(),
                                      style: FontTheme.neoDgm18Medium
                                          .apply(color: ColorTheme.boldBlue)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    "오늘 셋트 당 개수",
                                    style: FontTheme.neoDgm13Medium
                                        .apply(color: Colors.black),
                                  ),
                                  SizedBox(height: 10),
                                  Wrap(
                                    children: model.setPerQuantityList
                                        .map((e) => Padding(
                                            padding: EdgeInsets.only(left: 3),
                                            child: Text(
                                              e.toString(),
                                              style: FontTheme.neoDgm18Medium
                                                  .apply(
                                                      color: (e <= 5 || e >= 16)
                                                          ? Colors.red
                                                          : Colors.black),
                                            )))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          model.setPerError,
                          style: FontTheme.neoDgm13Regular
                              .apply(color: Colors.black),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AutoSizeText(
                        "쉬는 시간",
                        style:
                            FontTheme.neoDgm20Medium.apply(color: Colors.black),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                setState(() {
                                  model.decreaseRestTime();
                                });
                              }),
                          AutoSizeText(
                            model.setRestTime.toString() + "초",
                            style: FontTheme.neoDgm20Medium
                                .apply(color: ColorTheme.boldBlue),
                            maxLines: 1,
                          ),
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              onPressed: () {
                                setState(() {
                                  model.increaseRestTime();
                                });
                              })
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          model.restTimeError,
                          style: FontTheme.neoDgm13Regular
                              .apply(color: Colors.black),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                model.dialogApply();
                              },
                              child: AutoSizeText(
                                "확인",
                                style: FontTheme.neoDgm20Medium
                                    .apply(color: ColorTheme.boldBlue),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
          }));
}

_infoHypertrophy(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.55,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      "근비대 훈련이란?",
                      style:
                          FontTheme.neoDgm20Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      "* 목표",
                      style: FontTheme.neoDgm18Medium
                          .apply(color: ColorTheme.boldBlue),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      "근력을 키우자!",
                      style:
                          FontTheme.neoDgm16Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      "* SET",
                      style: FontTheme.neoDgm18Medium
                          .apply(color: ColorTheme.boldBlue),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      "한 번에 6-15회 할 수 있는 무게로 해요",
                      style:
                          FontTheme.neoDgm16Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      "* 횟수",
                      style: FontTheme.neoDgm18Medium
                          .apply(color: ColorTheme.boldBlue),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      "하루 최대 반복 횟수는 30-75회에요",
                      style:
                          FontTheme.neoDgm16Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      "* 휴식",
                      style: FontTheme.neoDgm18Medium
                          .apply(color: ColorTheme.boldBlue),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      "한 set 당 2-3분 쉬어요",
                      style:
                          FontTheme.neoDgm16Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AutoSizeText(
                      "* 예시",
                      style: FontTheme.neoDgm18Medium
                          .apply(color: ColorTheme.boldBlue),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      "한 set 12회 반복을 하면",
                      style:
                          FontTheme.neoDgm16Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    AutoSizeText(
                      "하루 최대 반복 횟수가 30-75회이므로",
                      style:
                          FontTheme.neoDgm16Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    AutoSizeText(
                      "3 set ~ 6 set 까지 가능",
                      style:
                          FontTheme.neoDgm16Medium.apply(color: Colors.black),
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "OK",
                              style: FontTheme.neoDgm20Medium
                                  .apply(color: ColorTheme.boldBlue),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () => Get.to(IntroView()),
                      child: AutoSizeText(
                        "튜토리얼 다시 볼까요?",
                        style: FontTheme.neoDgm16Medium
                            .apply(color: ColorTheme.boldBlue),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )));
}
