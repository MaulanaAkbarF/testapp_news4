import 'package:flutter/material.dart';

class StyleApp {
  static double fontSize = 0;
  static String fontFamily = '';

  // Font Statis
  static TextStyle microTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 0.45,
    fontWeight: FontWeight.normal,
  );

  static TextStyle verySmallTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 0.55,
    fontWeight: FontWeight.normal,
  );

  static TextStyle smallTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 0.68,
    fontWeight: FontWeight.normal,
  );

  static TextStyle mediumTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 0.78,
    fontWeight: FontWeight.normal,
  );

  static TextStyle semiLargeTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 0.9,
    fontWeight: FontWeight.normal,
  );

  static TextStyle largeTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 1,
    fontWeight: FontWeight.normal,
  );

  static TextStyle extraLargeTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 1.25,
    fontWeight: FontWeight.normal,
  );

  static TextStyle giantTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 1.7,
    fontWeight: FontWeight.normal,
  );

  static TextStyle giganticTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 2.35,
    fontWeight: FontWeight.normal,
  );

  static TextStyle extraGiganticTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 3,
    fontWeight: FontWeight.normal,
  );

  static TextStyle mediumInputTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 1,
    fontWeight: FontWeight.normal,
    color: Color.fromRGBO(0, 0, 0, 1),
  );

  static TextStyle largeInputTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: StyleApp.fontSize * 1.4,
    fontWeight: FontWeight.normal,
    color: Color.fromRGBO(0, 0, 0, 1),
  );

  // Font dinamis
  static TextStyle commonTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );

  static TextStyle boldTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldLargeTextStyle = TextStyle(
    fontFamily: StyleApp.fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle getTextStyle({
    bool isBold = false,
    Color? textColor,
    bool isItalic = false,
    double? customFontSize,
  }) {
    TextStyle textStyle = isBold ? boldTextStyle : commonTextStyle;

    if (textColor != null) {
      textStyle = textStyle.copyWith(color: textColor);
    }

    if (isItalic) {
      textStyle = textStyle.copyWith(fontStyle: FontStyle.italic);
    }

    if (customFontSize != null) {
      textStyle = textStyle.copyWith(fontSize: customFontSize);
    }

    return textStyle;
  }
}

