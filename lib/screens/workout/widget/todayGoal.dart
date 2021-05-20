import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';

enum orderType { one, two, three }

class TodayGoal extends StatelessWidget {
  final BuildContext ctx;
  final String title;
  final String quantity;
  final orderType setType;
  final List<int>? setList;

  const TodayGoal(
      {Key? key,
      required this.ctx,
      required this.title,
      required this.quantity,
      required this.setType,
      this.setList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(ctx).size.height * 0.23,
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.mediumBlue, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorTheme.mediumBlue, width: 0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: ColorTheme.mediumBlue,
            ),
            child: Center(
                child: AutoSizeText(
              title,
              style: FontTheme.neoDgm16Medium.apply(color: Colors.white),
            )),
            width: 400,
            height: 40,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorTheme.mediumBlue, width: 0.5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                  child: AutoSizeText(
                quantity,
                style: FontTheme.neoDgm40Medium,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
