import 'package:flutter/material.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';

class ChoiceButton extends StatelessWidget {
  final VoidCallback onPress;
  final Color setColor;
  final String setText;
  final TextStyle setStyle;
  final Color setTextColor;
  final double? setWidth;
  final double? setHeight;

  const ChoiceButton({
    Key? key,
    required this.onPress,
    required this.setColor,
    required this.setText,
    required this.setStyle,
    required this.setTextColor,
    this.setWidth,
    this.setHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: setColor,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                color: ColorTheme.mediumBlue.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: setWidth ?? MediaQuery.of(context).size.width,
          height: setHeight ?? 80,
          child: Center(
            child: Text(
              setText,
              style: setStyle.apply(color: setTextColor),
            ),
          ),
        ));
  }
}
