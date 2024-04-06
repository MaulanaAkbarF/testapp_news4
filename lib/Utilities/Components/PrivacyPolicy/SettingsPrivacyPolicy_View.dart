import 'package:flutter/material.dart';
import '../../../Layout/Style/Styleapp.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../Language/UserLanguages.dart';

class SettingsPrivacyPolicy extends StatefulWidget {

  const SettingsPrivacyPolicy({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPrivacyPolicy> createState() => _SettingsPrivacyPolicyState();
}

class _SettingsPrivacyPolicyState extends State<SettingsPrivacyPolicy> {
  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['settingPrivacyPolicyPageText'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadPageText();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Scaffold(
      body: PopScope(
        canPop: true,
        child: SafeArea(
          child: AnimateFadeVerticalScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  SimpleAppBar(
                    leftText: idPageText?[0]['BackButton'] ?? 'No Text',
                    leftIcon: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GradientText(
                        text: idPageText?[0]['Header'] ?? 'No Text',
                        textStyle: StyleApp.giantTextStyle.copyWith(fontWeight: FontWeight.w400),
                        gradientColors: [Colors.green.shade200, Colors.green.shade300],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      idPageText?[0]['SubHeader'] ?? 'No Text',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: StyleApp.mediumTextStyle.copyWith(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText0Label'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.extraLargeTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText0Desc'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.mediumTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText1Label'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.extraLargeTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText1Desc'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.mediumTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText2Label'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.extraLargeTextStyle.copyWith(
                          color: themeColors.textColorRegular,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText2Desc'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.mediumTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText3Label'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.extraLargeTextStyle.copyWith(
                          color: themeColors.textColorRegular,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['SubText3Desc'] ?? 'No Text',
                      textAlign: TextAlign.justify,
                      style: StyleApp.mediumTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              )
          ),
        ),
      ),
    );
  }
}
