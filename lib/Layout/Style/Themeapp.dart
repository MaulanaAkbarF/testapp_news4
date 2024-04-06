import 'package:flutter/material.dart';

class ThemeColors {
  final BuildContext context;
  late ThemeData themeData;
  late Color textColorRegular;
  late Color textColorRegularFlipped;
  late Color textColorAppBar;
  late Color textColorTapped;
  late Color textFieldColor;
  late Color containerColorGrey;
  late Color containerColorLightGrey;
  late Color containerColorLightGreen;
  late Color containerColorDarkGreen;
  late Color containerColorLightPurple;
  late Color containerColorDarkPurple;
  late Color containerColorLightBlue;
  late Color containerColorDarkBlue;
  late Color warningColor;

  ThemeColors({
    required this.context
  })

  {
    themeData = Theme.of(context);
    textColorRegular = themeData.brightness == Brightness.light ? Colors.black : Colors.white;
    textColorRegularFlipped = themeData.brightness == Brightness.light ? Colors.white : Colors.black;
    textColorAppBar = themeData.brightness == Brightness.light ? Colors.blueAccent : Colors.lightBlueAccent;
    textColorTapped = themeData.brightness == Brightness.light ? Colors.blueAccent : Colors.lightBlueAccent;
    textFieldColor = themeData.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade800;
    containerColorGrey = themeData.brightness == Brightness.light ? Colors.grey.shade200 : Colors.grey.shade800;
    containerColorLightGrey = themeData.brightness == Brightness.light ? Colors.grey.shade800 : Colors.grey.shade200;
    containerColorLightGreen = themeData.brightness == Brightness.light ? Colors.green.shade700 : Colors.green.shade300;
    containerColorDarkGreen = themeData.brightness == Brightness.light ? Colors.green.shade200 : Colors.green.shade600;
    containerColorLightPurple = themeData.brightness == Brightness.light ? Colors.purple.shade200 : Colors.purple.shade900;
    containerColorDarkPurple = themeData.brightness == Brightness.light ? Colors.purple.shade900 : Colors.purple.shade200;
    containerColorLightBlue = themeData.brightness == Brightness.light ? Colors.blue.shade200 : Colors.blue.shade900;
    containerColorDarkBlue = themeData.brightness == Brightness.light ? Colors.blue.shade900 : Colors.blue.shade200;
    warningColor = themeData.brightness == Brightness.light ? Colors.red : Colors.redAccent.shade200;
  }
}