import 'package:flutter/material.dart';

import '../Style/Styleapp.dart';
import '../Style/Themeapp.dart';
import 'ButtonStyles.dart';
import 'TextFormFieldStyles.dart';

class RegularAcceptedDialog extends StatelessWidget {
  final String header;
  final String description;
  final String acceptedText;
  final String loadingAcceptedText;
  final TextStyle? headerTextStyle;
  final TextStyle? descriptionTextStyle;
  final Icon icon;
  final Color iconColor;
  final double iconSize;
  final Function() acceptedOnTap;

  const RegularAcceptedDialog({
    super.key,
    this.header = 'Warning',
    required this.description,
    this.acceptedText = 'OK',
    this.loadingAcceptedText = 'Processing',
    this.headerTextStyle,
    this.descriptionTextStyle,
    this.icon = const Icon(Icons.warning),
    this.iconColor = Colors.red,
    this.iconSize = 40,
    required this.acceptedOnTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: themeColors.containerColorGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    header,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: headerTextStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Icon(
                      icon.icon,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: descriptionTextStyle ?? StyleApp.mediumTextStyle.copyWith(color: themeColors.textColorRegular),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Flexible(
                      child: AnimateProgressButton(
                        labelButton: acceptedText,
                        labelButtonStyle: StyleApp.mediumTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            color: themeColors.textColorRegular
                        ),
                        labelProgress: loadingAcceptedText,
                        height: 40,
                        margin: const EdgeInsets.all(5),
                        containerColor: Colors.blue.shade700,
                        containerRadius: 10,
                        onTap: () async {
                          acceptedOnTap();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegularDialog extends StatelessWidget {
  final String image;
  final String header;
  final String description;
  final String declinedText;
  final String acceptedText;
  final String loadingDeclinedText;
  final String loadingAcceptedText;
  final TextStyle? headerTextStyle;
  final TextStyle? descriptionTextStyle;
  final Icon icon;
  final Color iconColor;
  final double iconSize;
  final Function() declinedOnTap;
  final Function() acceptedOnTap;

  const RegularDialog({
    super.key,
    this.image = 'assets/Image/myonionpemberitahuan.png',
    this.header = 'Warning',
    required this.description,
    this.declinedText = 'Cancel',
    this.acceptedText = 'OK',
    this.loadingDeclinedText = 'Back to App',
    this.loadingAcceptedText = 'Processing',
    this.headerTextStyle,
    this.descriptionTextStyle,
    this.icon = const Icon(Icons.warning),
    this.iconColor = Colors.red,
    this.iconSize = 40,
    required this.declinedOnTap,
    required this.acceptedOnTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: themeColors.containerColorGrey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(image, height: 30,)),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      icon.icon,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
                  Text(
                    header,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: headerTextStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: descriptionTextStyle ?? StyleApp.mediumTextStyle.copyWith(color: themeColors.textColorRegular),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Flexible(
                        child: AnimateProgressButton(
                          labelButton: declinedText,
                          labelButtonStyle: StyleApp.mediumTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              color: themeColors.textColorRegular
                          ),
                          labelProgress: loadingDeclinedText,
                          height: 40,
                          margin: const EdgeInsets.all(5),
                          containerColor: Colors.blue.shade700,
                          containerRadius: 10,
                          onTap: () async {
                            declinedOnTap();
                          },
                        ),
                      ),
                      Flexible(
                        child: AnimateProgressButton(
                          labelButton: acceptedText,
                          labelButtonStyle: StyleApp.mediumTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              color: themeColors.textColorRegular
                          ),
                          labelProgress: loadingAcceptedText,
                          height: 40,
                          margin: const EdgeInsets.all(5),
                          containerColor: Colors.red.shade700,
                          containerRadius: 10,
                          onTap: () async {
                            acceptedOnTap();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputNumberDialog extends StatelessWidget {
  final String image;
  final String header;
  final String? description;
  final String declinedText;
  final String acceptedText;
  final String loadingDeclinedText;
  final String loadingAcceptedText;
  final TextStyle? headerTextStyle;
  final TextStyle? descriptionTextStyle;
  final TextEditingController controller;
  final String? textFieldLabel;
  final Function() declinedOnTap;
  final Function() acceptedOnTap;

  const InputNumberDialog({
    super.key,
    this.image = 'assets/Image/myoniondialog.png',
    this.header = 'Warning',
    this.description,
    this.declinedText = 'Cancel',
    this.acceptedText = 'OK',
    this.loadingDeclinedText = 'Back to App',
    this.loadingAcceptedText = 'Processing',
    this.headerTextStyle,
    this.descriptionTextStyle,
    required this.controller,
    required this.textFieldLabel,
    required this.declinedOnTap,
    required this.acceptedOnTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: themeColors.containerColorGrey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(image, height: 30,)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        children: [
                          Text(
                            header,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: headerTextStyle ?? StyleApp.extraLargeTextStyle.copyWith(color: themeColors.textColorRegular, fontWeight: FontWeight.bold),
                          ),
                          if (description != null)...[
                            Text(
                              description ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              textAlign: TextAlign.center,
                              style: descriptionTextStyle ?? StyleApp.mediumTextStyle.copyWith(color: themeColors.textColorRegular),
                            ),
                          ]
                        ],
                      ),
                    ),
                    AnimateTextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      labelText: textFieldLabel,
                      icon: const Icon(Icons.timer),
                      containerColor: themeColors.containerColorLightPurple,
                      containerRadius: 10,
                      borderAnimationColor: themeColors.textColorRegular,
                      borderAnimationRadius: 10,
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Flexible(
                          child: AnimateProgressButton(
                            labelButton: declinedText,
                            labelButtonStyle: StyleApp.mediumTextStyle.copyWith(
                                fontWeight: FontWeight.w900,
                                color: themeColors.textColorRegular
                            ),
                            labelProgress: loadingDeclinedText,
                            height: 40,
                            margin: const EdgeInsets.all(5),
                            containerColor: Colors.red.shade700,
                            containerRadius: 10,
                            onTap: () async {
                              declinedOnTap();
                            },
                          ),
                        ),
                        Flexible(
                          child: AnimateProgressButton(
                            labelButton: acceptedText,
                            labelButtonStyle: StyleApp.mediumTextStyle.copyWith(
                                fontWeight: FontWeight.w900,
                                color: themeColors.textColorRegular
                            ),
                            labelProgress: loadingAcceptedText,
                            height: 40,
                            margin: const EdgeInsets.all(5),
                            containerColor: Colors.blue.shade700,
                            containerRadius: 10,
                            onTap: () async {
                              acceptedOnTap();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
