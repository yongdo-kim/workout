import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stacked/stacked.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';
import 'package:yd_workout_program/untils/helper/datetime_format_helper.dart';
import 'calendar_view_model.dart';

//CalendarView
/// 참 잘했어요 픽셀 이미지 필요함
class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
      viewModelBuilder: () => CalendarViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  header(context: context, model: model),
                  middleWidget(context: context, model: model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget header(
    {required BuildContext context, required CalendarViewModel model}) {
  return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              DateTimeFormatHelper.convertToYYYYY(model.today),
              style: FontTheme.neoDgm20Regular,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: model.movePrevMonth),
              Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  DateTimeFormatHelper.convertToMM(model.today) + "월",
                  style: FontTheme.neoDgm30Medium,
                ),
              ),
              IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed:
                      model.isSameDay(value: model.today, today: DateTime.now())
                          ? null
                          : model.moveNextMonth),
            ],
          ),
        ],
      ));
}

Widget middleWidget(
    {required BuildContext context, required CalendarViewModel model}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "운동일지",
          style: FontTheme.neoDgm20Regular,
        ),
        model.monthHistoryList.length == 0
            ? noHistoryItem(context)
            : Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: AnimationLimiter(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: model.monthHistoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                              child: historyItem(
                                  context,
                                  model.monthHistoryList.length - 1 - index,
                                  model)),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    ),
  );
}

Widget historyItem(BuildContext context, int index, CalendarViewModel model) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30, top: 30),
    child: Stack(
      children: [
        Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.asset('assets/images/stamp.png',width: 120, height: 120,)),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: ColorTheme.mediumBlue),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        DateTimeFormatHelper.convertTomdHm(
                          model.monthHistoryList[index].dateTime,
                        ),
                        style: FontTheme.neoDgm16Medium,
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            '운동타입 : ',
                            style: FontTheme.neoDgm13Medium,
                          ),
                          AutoSizeText(
                            "근비대운동",
                            style: FontTheme.neoDgm13Medium,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                        text: '오늘 나는 총 ',
                        style: FontTheme.neoDgm20Medium,
                        children: [
                          TextSpan(
                              text:
                              '${model.monthHistoryList[index].todayGoal.toString()}',
                              style: FontTheme.neoDgm20Medium
                                  .apply(color: ColorTheme.boldBlue)),
                          TextSpan(text: '개를 했다'),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                        text: '셋트는 ',
                        style: FontTheme.neoDgm20Medium,
                        children: [
                          TextSpan(
                              text:
                              '${model.monthHistoryList[index].todaySet.toString()}',
                              style: FontTheme.neoDgm20Medium
                                  .apply(color: ColorTheme.boldBlue)),
                          TextSpan(text: '개를 유지,'),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                        text: '한 셋트당 ',
                        style: FontTheme.neoDgm20Medium,
                        children: [
                          TextSpan(
                              text:
                              '${model.monthHistoryList[index].setPerQuantityList.toString()}',
                              style: FontTheme.neoDgm20Medium
                                  .apply(color: ColorTheme.boldBlue)),
                          TextSpan(text: '개를 해냈다!'),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                        text: '휴식 시간은 ',
                        style: FontTheme.neoDgm20Medium,
                        children: [
                          TextSpan(
                              text:
                              '${model.monthHistoryList[index].setRestTime.toString()}',
                              style: FontTheme.neoDgm20Medium
                                  .apply(color: ColorTheme.boldBlue)),
                          TextSpan(text: '초 마다 쉬었다'),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                        text: '다음 목표는 ',
                        style: FontTheme.neoDgm20Medium,
                        children: [
                          TextSpan(
                              text:
                              '${model.monthHistoryList[index].nextGoal.toString()}',
                              style: FontTheme.neoDgm20Medium
                                  .apply(color: ColorTheme.boldBlue)),
                          TextSpan(text: '개를 이루자!'),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    )
  );
}

Widget noHistoryItem(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30, top: 30),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: ColorTheme.mediumBlue),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "운동일지가 없어요",
            style: FontTheme.neoDgm30Medium,
          ),
        ],
      ),
    ),
  );
}
