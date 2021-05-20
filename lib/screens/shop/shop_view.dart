import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';
import 'package:yd_workout_program/global_widgets/choice_button.dart';

import 'shop_view_model.dart';
import 'widgets/all_complete.dart';

class ShopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShopViewModel>.reactive(
      viewModelBuilder: () => ShopViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Visibility(
                visible: model.userItemCollection >= model.totalCollection,
                child: AllCompleteStage(
                  model: model,
                )),
            eventPage(model, context),
            IgnorePointer(ignoring: true, child: loadingImage(model, context)),
            Visibility(
                visible: model.isAdMobLoading,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                    )))),
          ],
        )),
      ),
    );
  }
}

Widget eventPage(ShopViewModel model, BuildContext context) {
  return Column(
    children: [
      remainPoint(model, context),
      Expanded(child: mainPage(model, context))
    ],
  );
}

Widget remainPoint(ShopViewModel model, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AutoSizeText(
                "수집률",
                style: FontTheme.neoDgm20Medium,
              ),
              SizedBox(
                width: 10,
              ),
              AutoSizeText(
                model.collectPercentage + "%",
                style:
                    FontTheme.neoDgm25Medium.apply(color: ColorTheme.boldBlue),
              ),
            ],
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: ColorTheme.boldBlue),
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
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
    ),
  );
}

Widget mainPage(ShopViewModel model, BuildContext context) {
  return Column(
    children: [
      Expanded(child: Container()),
      Container(
        color: model.userItemCollection >= model.totalCollection
            ? Colors.white.withOpacity(0.9)
            : Colors.transparent,
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              model.userItemCollection >= model.totalCollection
                  ? '축하드립니다!\n모든 수집품을 모았어요!\nCongratulations!'
                  : !model.isPaid
                      ? '여러번 터치해서\n상자를 열어봐!'
                      : '마구마구 클릭해!',
              textStyle: FontTheme.neoDgm30Medium,
              textAlign: TextAlign.center,
              colors: [
                Colors.purple,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],
            ),
          ],
          totalRepeatCount: 1000,
          isRepeatingAnimation: true,
        ),
      ),
      SizedBox(
        height: 80,
      ),
      model.userItemCollection >= model.totalCollection
          ? Container()
          : GestureDetector(
              onTap: !model.isPaid && model.point <= 0
                  ? () => adDialog(context, model)
                  : !model.isPaid && model.point >= 100
                      ? () => checkDialog(context, model)
                      : () => model.setCount(),
              child: Image.asset(
                model.boxImage,
                width: 150,
                height: 150,
              )),
      SizedBox(
        height: 80,
      ),
      if (!model.isPaid)
        Container(
          color: model.userItemCollection >= model.totalCollection
              ? Colors.white.withOpacity(0.9)
              : Colors.transparent,
          child: AutoSizeText(
            model.userItemCollection >= model.totalCollection
                ? '모든 컬렉션 달성!'
                : '100p 쓰고 상품받자!',
            style: FontTheme.neoDgm25Medium,
          ),
        )
      else
        AutoSizeText.rich(
          TextSpan(text: '상품을 ', style: FontTheme.neoDgm20Medium, children: [
            TextSpan(
                text: '마구마구',
                style:
                    FontTheme.neoDgm25Medium.apply(color: ColorTheme.boldBlue)),
            TextSpan(text: ' 클릭해요!'),
          ]),
        ),

      //광고달기
      SizedBox(
        height: 20,
      ),
      Expanded(child: Container()),
    ],
  );
}

Widget loadingImage(ShopViewModel model, BuildContext context) {
  return AnimatedOpacity(
    duration: Duration(milliseconds: 500),
    opacity: model.isLoading ? 1.0 : 0.0,
    child: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/shop_big.png"),
          SizedBox(
            height: 30,
          ),
          AutoSizeText(
            '샵에 어서오세요!',
            style: FontTheme.neoDgm34Medium,
          )
        ],
      ),
    ),
  );
}

adDialog(
  BuildContext context,
  ShopViewModel model,
) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  AutoSizeText(
                    '포인트가 모자라요!\n광고를 시청하면 포인트를 받을 수 있어요',
                    style: FontTheme.neoDgm20Regular,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: AutoSizeText(
                            '싫어요',
                            style: FontTheme.neoDgm16Medium
                                .apply(color: Colors.red),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            model.showAdMob();
                            Navigator.of(context).pop();
                          },
                          child: AutoSizeText(
                            '좋아요',
                            style: FontTheme.neoDgm16Medium
                                .apply(color: ColorTheme.boldBlue),
                          )),
                    ],
                  )
                ],
              ),
            ),
          )));
}

checkDialog(
  BuildContext context,
  ShopViewModel model,
) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  AutoSizeText(
                    '100p를 써서 상품을 뽑아볼까요?',
                    style: FontTheme.neoDgm20Regular,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: AutoSizeText(
                            '싫어요',
                            style: FontTheme.neoDgm16Medium
                                .apply(color: Colors.red),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            model.setPaidStatus();
                            Navigator.of(context).pop();
                          },
                          child: AutoSizeText(
                            '좋아요',
                            style: FontTheme.neoDgm16Medium
                                .apply(color: ColorTheme.boldBlue),
                          )),
                    ],
                  )
                ],
              ),
            ),
          )));
}
