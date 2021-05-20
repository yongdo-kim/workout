import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';
import 'package:yd_workout_program/screens/workout/widget/setting.dart';
import 'package:yd_workout_program/screens/workout/widget/todayGoal.dart';
import 'workout_view_model.dart';

class WorkOutView extends StatefulWidget {
  @override
  _WorkOutViewState createState() => _WorkOutViewState();
}

class _WorkOutViewState extends State<WorkOutView> {



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkOutViewModel>.reactive(
      viewModelBuilder: () => WorkOutViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        SettingWidget(),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: TodayGoal(
                                ctx: context,
                                title: "오늘 목표",
                                quantity: model.todayGoal.toString(),
                                setType: orderType.one,
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TodayGoal(
                                ctx: context,
                                title: "오늘 셋트",
                                quantity: model.todaySet.toString(),
                                setType: orderType.two,
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TodayGoal(
                                ctx: context,
                                title: "내일 목표",
                                quantity: (model.todayGoal + 1).toString(),
                                setType: orderType.three,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: model.setPerQuantityList.length != 0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  "남은 셋트 수 ${model.setPerQuantityList.length}",
                                  style: FontTheme.neoDgm20Medium
                                      .apply(color: Colors.white),
                                )),
                          ),
                        ),
                        Wrap(
                          children: model.setPerQuantityList
                              .map((e) => Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 2.0,
                                          color: ColorTheme.boldBlue,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        e.toString(),
                                        style: FontTheme.neoDgm25Medium,
                                      ),
                                    ),
                                  )))
                              .toList(),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Image.asset(
                          model.yellowCatStatus,
                          width: 130,
                          height: 120,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Visibility(
                                visible: model.setStartText == "휴식 중...",
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    WavyAnimatedText(
                                      '휴식 중..!',
                                      textStyle: FontTheme.neoDgm18Medium
                                          .apply(color: Colors.white),
                                      speed: const Duration(milliseconds: 250),
                                    ),
                                  ],
                                  totalRepeatCount: 120,
                                  pause: const Duration(milliseconds: 400),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                ),
                              ),
                              model.setStartText != "휴식 중..."
                                  ? TextButton(
                                      onPressed: model.startButton,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 2.0,
                                                color: ColorTheme.mediumBlue),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Center(
                                            child: Text(
                                          model.setStartText,
                                          style: FontTheme.neoDgm18Medium
                                              .apply(color: Colors.black),
                                        )),
                                      ),
                                    )
                                  : FAProgressBar(
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                      currentValue: model.setCurrentTime,
                                      //줄어드는 수
                                      size: 50,
                                      maxValue: model.setRestTime,
                                      //전체수
                                      changeColorValue: 60,
                                      changeProgressColor: Colors.lightBlue,
                                      backgroundColor: Colors.white,
                                      progressColor: ColorTheme.mediumBlue,
                                      animatedDuration:
                                          const Duration(milliseconds: 300),
                                      direction: Axis.horizontal,
                                      verticalDirection: VerticalDirection.up,
                                      displayText: '초',
                                    ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}


