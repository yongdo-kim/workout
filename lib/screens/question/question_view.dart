// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
// import 'package:yd_workout_program/config/color_theme.dart';
// import 'package:yd_workout_program/config/font_theme.dart';
// import 'package:yd_workout_program/global_widgets/choice_button.dart';
//
// import 'question_view_model.dart';
//
// class QuestionView extends StatefulWidget {
//   @override
//   _QuestionViewState createState() => _QuestionViewState();
// }
//
// class _QuestionViewState extends State<QuestionView> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<QuestionViewModel>.reactive(
//         viewModelBuilder: () => QuestionViewModel(),
//         onModelReady: (model) => model.initialize(context),
//         builder: (context, model, child) {
//           return !model.hasSaveData
//               ? Scaffold(
//                   body: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       if (!model.isSecondShow)
//                         AnimatedOpacity(
//                           duration: Duration(milliseconds: 500),
//                           opacity: !model.isFirstDone ? 1.0 : 0.0,
//                           child: AutoSizeText('이 앱을 써본 적 있나요?',style: FontTheme.neoDgm20Medium,),
//                         )else
//                       AnimatedOpacity(
//                           opacity: model.isSecondShow ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 500),
//                           child: Text(
//                             "어떤 훈련을 할건가요?",
//                             style: FontTheme.neoDgm20Medium,
//                           )),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       if (!model.isSecondShow)
//                         AnimatedOpacity(
//                           duration: Duration(milliseconds: 500),
//                           opacity: !model.isFirstDone ? 1.0 : 0.0,
//                           child: ChoiceButton(
//                             onPress: !model.isSecondShow
//                                 ? () => model.firstDone()
//                                 : () {},
//                             setStyle: FontTheme.neoDgm34Medium,
//                             setText: '처음이에요!',
//                             setColor: ColorTheme.mediumBlue,
//                             setTextColor: Colors.white,
//                           ),
//                         )
//                       else
//                         Stack(
//                           children: [
//                             AnimatedOpacity(
//                               duration: Duration(milliseconds: 500),
//                               opacity: model.isSecondShow ? 1.0 : 0.0,
//                               child: ChoiceButton(
//                                 onPress: () => model.saveWorkType("strength"),
//                                 setStyle: FontTheme.neoDgm34Medium,
//                                 setText: '스트렝스 훈련',
//                                 setColor: ColorTheme.mediumBlue,
//                                 setTextColor: Colors.white,
//                               ),
//                             ),
//                             Positioned.fill(
//                               child: Padding(
//                                 padding: EdgeInsets.only(right: 10, top: 5),
//                                 child: Align(
//                                   alignment: Alignment.topRight,
//                                   child: IconButton(
//                                     icon: Icon(
//                                       Icons.help_outline_outlined,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                     onPressed: () => _infoStrength(context),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       if (!model.isSecondShow)
//                         AnimatedOpacity(
//                           duration: Duration(milliseconds: 500),
//                           opacity: !model.isFirstDone ? 1.0 : 0.0,
//                           child: ChoiceButton(
//                             onPress: model.goToHomeView,
//                             setStyle: FontTheme.neoDgm34Medium,
//                             setText: '할 줄 알아요!',
//                             setColor: ColorTheme.mediumBlue,
//                             setTextColor: Colors.white,
//                           ),
//                         )
//                       else
//                         Stack(
//                           children: [
//                             AnimatedOpacity(
//                               duration: Duration(milliseconds: 500),
//                               opacity: model.isSecondShow ? 1.0 : 0.0,
//                               child: ChoiceButton(
//                                 onPress: () =>
//                                     model.saveWorkType("hypertrophy"),
//                                 setStyle: FontTheme.neoDgm34Medium,
//                                 setText: '근비대 훈련',
//                                 setColor: ColorTheme.mediumBlue,
//                                 setTextColor: Colors.white,
//                               ),
//                             ),
//                             Positioned.fill(
//                               child: Padding(
//                                 padding: EdgeInsets.only(right: 10, top: 5),
//                                 child: Align(
//                                   alignment: Alignment.topRight,
//                                   child: IconButton(
//                                     icon: Icon(
//                                       Icons.help_outline_outlined,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                     onPressed: () => _infoHypertrophy(context),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                     ],
//                   ),
//                 ))
//               : Container();
//         });
//   }
// }
//
// _infoStrength(BuildContext context) {
//   showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (_) => Dialog(
//               child: Padding(
//             padding: EdgeInsets.all(15),
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               height: MediaQuery.of(context).size.height * 0.55,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "스트렝스 훈련이란?",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "* 목표",
//                       style:
//                           FontTheme.neoDgm18Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "근력을 키우자!",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "* SET",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "한 번에 1-5회 할 수 있는 무게로 해요",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "* 횟수",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "하루 최대 반복 횟수는 25-40회에요",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "* 휴식",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "한 set 당 4-5분 쉬어요",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     AutoSizeText(
//                       "* 예시",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "한 set 5회 반복",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     AutoSizeText(
//                       "하루 최대 반복 횟수 25-40회",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     AutoSizeText(
//                       "5 set 부터 8 set 까지 가능",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                             onPressed: () => Navigator.of(context).pop(),
//                             child: Text(
//                               "OK",
//                               style: FontTheme.neoDgm20Medium
//                                   .apply(color: Colors.black),
//                             )),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )));
// }
//
// _infoHypertrophy(BuildContext context) {
//   showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (_) => Dialog(
//               child: Padding(
//             padding: EdgeInsets.all(15),
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               height: MediaQuery.of(context).size.height * 0.55,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "근비대 훈련이란?",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "* 목표",
//                       style:
//                           FontTheme.neoDgm18Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "근력을 키우자!",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "* SET",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "한 번에 6-15회 할 수 있는 무게로 해요",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "* 횟수",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "하루 최대 반복 횟수는 30-75회에요",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     AutoSizeText(
//                       "* 휴식",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "한 set 당 2-3분 쉬어요",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     AutoSizeText(
//                       "* 예시",
//                       style:
//                           FontTheme.neoDgm20Medium.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AutoSizeText(
//                       "한 set 12회 반복을 하면",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     AutoSizeText(
//                       "하루 최대 반복 횟수 30-75회이므로",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     AutoSizeText(
//                       "3 set 부터 6 set 까지 가능",
//                       style:
//                           FontTheme.neoDgm16Regular.apply(color: Colors.black),
//                       maxLines: 1,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                             onPressed: () => Navigator.of(context).pop(),
//                             child: Text(
//                               "OK",
//                               style: FontTheme.neoDgm20Medium
//                                   .apply(color: Colors.black),
//                             )),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )));
// }
