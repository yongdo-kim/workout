import 'dart:io';
import 'package:flutter/material.dart';

import 'font_theme.dart';


//https://www.design-seeds.com/in-nature/flora/veronica-hues/ 색깔
class ColorTheme {
  static Color whiteBlue = Color(0xFFD3D6FD);
  static Color lightBlue = Color(0xFFAAB7F9);
  static Color mediumBlue = Color(0xFF5172DE);
  static Color boldBlue = Color(0xFF425AC6);
  static Color mediumBrown = Color(0xFF725473);
  static Color lightGreen = Color(0xFFC0CA9F);

}

ThemeData buildColorTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFFF4F4F4),
    // App Bar title Theme]
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    // App Bar Theme
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
          headline6: FontTheme.neoDgm16Medium.apply(color: ColorTheme.lightBlue)),
      elevation: 1,
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Color(0xFF000035).withOpacity(0.5),
      ),
    ),
  );
}

ThemeData buildLightTheme() {
  return ThemeData(
      primaryColor: MaterialColor(
        primaryColorInt,
        primarySwatch,
      ),
      errorColor: Colors.orange[700],
      //typography: typography,
      // textTheme: TextTheme(
      //   title: TextStyle(color: Colors.purple),
      //   button: TextStyle(color: Colors.blue),
      // ),
      textTheme: TextTheme(),
      cardColor: Colors.grey[50],
      cardTheme: CardTheme(
          //TODO: Card는 figma 참고
          ),
      unselectedWidgetColor: primaryColor,
      toggleableActiveColor: primaryColor,
      accentColor: primaryColor,
      iconTheme: IconThemeData(
        color: primaryColor,
        //color: Colors.blue
      ),
      appBarTheme: AppBarTheme(
        elevation: 1,
        color: Color(0xFFFAFAFA),
        iconTheme: IconThemeData(
          color: Colors.black45,
        ),
        actionsIconTheme: IconThemeData(
          color: primaryColor,
        ),
      ),
      primaryColorBrightness: Brightness.light,
      //AppBar Text Color
      primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black87)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
        inactiveTrackColor: primarySwatch[100],
        inactiveTickMarkColor: primarySwatch[200],
        overlayColor: primarySwatch[500]!.withOpacity(0.12),
        valueIndicatorColor: primaryColor,
      ),
      bottomAppBarTheme: BottomAppBarTheme(),
      snackBarTheme: SnackBarThemeData(actionTextColor: primarySwatch[200])
//      primaryColorLight: Color(0xFFFF5D60),
//      primaryColorDark: Color(0xFF9F0010),
//      accentColor: Color(0xFF2C2C2C),
//      bottomAppBarColor: Color(0xFFFAFAFA),
//      cardColor: Color(0xFFFAFAFA),
//      bottomSheetTheme:
//          BottomSheetThemeData(backgroundColor: Color(0xFFFAFAFA)),
//      snackBarTheme: SnackBarThemeData(backgroundColor: Color(0xFF202020)),
//      dialogBackgroundColor: Color(0xFFFFFFFF),
      );
}

ThemeData buildDarkTheme() {
  return ThemeData(
    primaryColor: MaterialColor(darkPrimaryColorInt, darkPrimarySwatch),
    brightness: Brightness.dark,
    //typography: typography,
    // textTheme: TextTheme(
    //   button: TextStyle(color: Colors.white),
    // ),
    iconTheme: IconThemeData(color: darkPrimarySwatch[300]),
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.grey[900],
      iconTheme: IconThemeData(
        color: Colors.white54,
      ),
      actionsIconTheme: IconThemeData(
        color: darkPrimaryColor,
      ),
    ),
    primaryColorBrightness: Brightness.dark,
    accentColor: darkPrimaryColor,
    canvasColor: Color(0xFF121212),
    errorColor: Colors.orange[700],
    unselectedWidgetColor: darkPrimaryColor,
    toggleableActiveColor: darkPrimaryColor,
    sliderTheme: SliderThemeData(
      thumbColor: darkPrimaryColor,
      activeTrackColor: darkPrimaryColor,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
      inactiveTrackColor: darkPrimarySwatch[200],
      inactiveTickMarkColor: darkPrimarySwatch[200],
      overlayColor: darkPrimarySwatch[500]!.withOpacity(0.12),
      valueIndicatorColor: darkPrimaryColor,
    ),
    bottomAppBarColor: Colors.grey[900],
    snackBarTheme: SnackBarThemeData(actionTextColor: darkPrimarySwatch[600]),
  );
}

//#region Theme
final int primaryColorInt = 0xFFF44336;
final Color primaryColor = Color(primaryColorInt);
final int darkPrimaryColorInt = 0xFFF44336;
final Color darkPrimaryColor = Color(darkPrimaryColorInt);

Map<int, Color> primarySwatch = {
  50: Color(0xFFFEEBEE),
  100: Color(0xFFFECDD2),
  200: Color(0xFFEF9A9A),
  300: Color(0xFFDB6775),
  400: Color(0xFFDB4456),
  500: Color(primaryColorInt),
  600: Color(0xFFC72337),
  700: Color(0xFFAC1326),
  800: Color(0xFF941323),
  900: Color(0xFF7C010F),
};

Map<int, Color> darkPrimarySwatch = {
  50: Color(0xFFFEEBEE),
  100: Color(0xFFFECDD2),
  200: Color(0xFFEF9A9A),
  300: Color(0xFFDB6565),
  400: Color(0xFFD84F4F),
  500: Color(darkPrimaryColorInt),
  600: Color(0xFFCF3E3E),
  700: Color(0xFFB53434),
  800: Color(0xFFA02A2A),
  900: Color(0xFF832727),
};
