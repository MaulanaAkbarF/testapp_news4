import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Style/Styleapp.dart';
import '../Style/Themeapp.dart';

// Tampilan Judul dengan Gradasi Warna
class SimpleAppBar extends StatelessWidget {
  final String? leftText;
  final String? rightText;
  final TextStyle? textStyle;
  final Color? textColor;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final Function()? leftOnTap;
  final Function()? rightOnTap;

  const SimpleAppBar({
    super.key,
    this.leftText,
    this.rightText,
    this.textStyle,
    this.textColor,
    this.leftIcon,
    this.rightIcon,
    this.leftOnTap,
    this.rightOnTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: leftOnTap ?? () => Get.back(),
            child: Row(
              children: [
                if (leftIcon != null) ...[
                  Icon(leftIcon!.icon, size: 16,),
                  const SizedBox(width: 8.0),
                ],
                Text(
                  leftText ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: textStyle ?? StyleApp.largeTextStyle.copyWith(
                    color: themeColors.textColorAppBar,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: rightOnTap ?? () => Get.back(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  rightText ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: textStyle ?? StyleApp.largeTextStyle.copyWith(
                    color: themeColors.textColorAppBar,
                  ),
                ),
                if (rightIcon != null) ...[
                  const SizedBox(width: 8.0),
                  Icon(rightIcon!.icon, size: 16,),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Tampilan Judul dengan Gradasi Warna
class GradientText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle? textStyle;
  final List<Color> gradientColors;

  const GradientText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.textStyle,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: gradientColors,
        ).createShader(bounds);
      },
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        text: TextSpan(
          text: text,
          style: textStyle ?? StyleApp.giantTextStyle.copyWith(
              fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}

// Tampilan Judul dengan Gradasi Warna
class WarningText extends StatelessWidget {
  final bool visible;
  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Icon icon;
  final Color? iconColor;
  final double iconSize;

  const WarningText({
    super.key,
    required this.visible,
    required this.text,
    this.textColor,
    this.textStyle,
    this.icon = const Icon(Icons.error),
    this.iconColor,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Visibility(
      visible: visible,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child:Icon(
              icon.icon,
              color: themeColors.warningColor, // Menggunakan iconColor
              size: iconSize,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textStyle ?? StyleApp.smallTextStyle.copyWith(color: themeColors.warningColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Tampilan Teks dengan garis di sisi kiri dan kanan
class LineText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double lineWidth;
  final double? lineHeight;
  final double lineSpacing;
  final Color? lineColor;
  final double lineOpacity;

  const LineText({
    super.key,
    required this.text,
    this.textStyle,
    this.lineWidth = 30,
    this.lineHeight,
    this.lineSpacing = 10,
    this.lineColor,
    this.lineOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    Color resolvedContainerColor = lineColor ?? themeColors.textColorRegular;

    return Container(
      constraints: const BoxConstraints(
        minWidth: 10,
        minHeight: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 10,
              maxWidth: 100,
              minHeight: 1,
            ),
            width: lineWidth,
            height: lineHeight,
            alignment: Alignment.centerRight,
            color: resolvedContainerColor.withOpacity(lineOpacity),
          ),
          SizedBox(width: lineSpacing),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: textStyle ?? StyleApp.mediumTextStyle.copyWith(color: themeColors.textColorRegular),
            ),
          ),
          SizedBox(width: lineSpacing),
          Container(
            constraints: const BoxConstraints(
              minWidth: 10,
              maxWidth: 100,
              minHeight: 1,
            ),
            width: lineWidth,
            height: lineHeight,
            alignment: Alignment.centerLeft,
            color: resolvedContainerColor.withOpacity(lineOpacity),
          ),
        ],
      ),
    );
  }
}