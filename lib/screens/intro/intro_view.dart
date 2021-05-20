import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yd_workout_program/config/font_theme.dart';


import 'intro_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroView extends StatefulWidget {
  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroViewModel>.reactive(
        viewModelBuilder: () => IntroViewModel(),
        onModelReady: (model) => model.initialize(context),
        builder: (context, model, child) {
          return IntroViewsFlutter(
            [
              PageViewModel(
                pageBackground: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.0, 1.0],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [Colors.lightGreen, Colors.green],
                    ),
                  ),
                ),
                iconImageAssetPath: 'assets/images/protein_01.png',
                bubble: Image.asset('assets/images/protein_01.png'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "이 프로그램은 건강해지기 위해 만들어졌어요",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText("부담가지 않는 개수로 천천히 해봐요"),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText("모든지 꾸준히 하는게 좋으니까요"),
                  ],
                ),
                title: const Text(
                  '튜토리얼',
                ),
                titleTextStyle: FontTheme.neoDgm40Medium,
                bodyTextStyle: FontTheme.neoDgm20Regular,
                mainImage: Image.asset(
                  'assets/images/grey_cat_basic_motion_ani.gif',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                ),
              ),
              PageViewModel(
                pageBackground: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.0, 1.0],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [Colors.amber, Colors.orange],
                    ),
                  ),
                ),
                iconImageAssetPath: 'assets/images/protein_01.png',
                bubble: Image.asset('assets/images/protein_01.png'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText("위의 숫자들의 의미는 뭘까요?"),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText("오늘의 목표는 총 30개를 하고"),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText("셋트는 3번을 해요"),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText("한 셋트당 10번을 하는거죠"),
                  ],
                ),
                title: const Text(
                  '튜토리얼',
                ),
                titleTextStyle: FontTheme.neoDgm40Medium,
                bodyTextStyle: FontTheme.neoDgm20Regular,
                mainImage: Image.asset(
                  'assets/images/intro01.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                ),
              ),
              PageViewModel(
                pageBackground: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.0, 1.0],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [Colors.lightBlueAccent, Colors.blue],
                    ),
                  ),
                ),
                iconImageAssetPath: 'assets/images/protein_02.png',
                bubble: Image.asset('assets/images/protein_02.png'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText("원하는 개수, 셋트, 휴식시간을"),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText("조절 할 수 있어요"),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText("한 셋트당 개수는 자동으로 변해요"),
                  ],
                ),
                title: const Text(
                  '튜토리얼',
                ),
                titleTextStyle: FontTheme.neoDgm40Medium,
                bodyTextStyle: FontTheme.neoDgm20Regular,
                mainImage: Image.asset(
                  'assets/images/intro02.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                ),
              ),
              PageViewModel(
                pageBackground: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.0, 1.0],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [Colors.orange, Colors.pinkAccent],
                    ),
                  ),
                ),
                iconImageAssetPath: 'assets/images/protein_02.png',
                bubble: Image.asset('assets/images/protein_02.png'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "꾸준히 운동하다보면 포인트를 얻어요",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText(
                      "포인트를 통해 컬렉션을 수집해요!",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                title: const Text(
                  '튜토리얼',
                ),
                titleTextStyle: FontTheme.neoDgm40Medium,
                bodyTextStyle: FontTheme.neoDgm20Regular,
                mainImage: Image.asset(
                  'assets/images/box_animation.gif',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                ),
              ),
              PageViewModel(
                pageBackground: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.0, 1.0],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [Colors.lightBlueAccent, Colors.blue],
                    ),
                  ),
                ),
                iconImageAssetPath: 'assets/images/protein_02.png',
                bubble: Image.asset('assets/images/protein_02.png'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "컬렉션 아이템을 계속 뽑아서",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText(
                      "아이템과 친구들을 만들어줘요!",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                title: const Text(
                  '튜토리얼',
                ),
                titleTextStyle: FontTheme.neoDgm40Medium,
                bodyTextStyle: FontTheme.neoDgm20Regular,
                mainImage: Image.asset(
                  'assets/images/intro03.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                ),
              ),
            ],
            showNextButton: true,
            showBackButton: true,
            onTapDoneButton: model.goToHomeView,
            pageButtonTextStyles: FontTheme.neoDgm20Medium.apply(color: Colors.white)
          );
        });
  }
}
