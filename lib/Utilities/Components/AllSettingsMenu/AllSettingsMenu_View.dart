import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Layout/Style/Styleapp.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Layout/Widget/ButtonStyles.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../AboutApp/SettingsAboutapp_View.dart';
import '../Language/UserLanguages.dart';
import '../Language/SettingsLanguages_View.dart';
import '../Preferences/SettingsPreferences_View.dart';
import '../PrivacyPolicy/SettingsPrivacyPolicy_View.dart';
import '../ReportBug/SettingsReportBug_View.dart';

class AllSettingsMenu extends StatefulWidget {
  const AllSettingsMenu({super.key});

  @override
  State<AllSettingsMenu> createState() => AllSettingsMenuState();
}

class AllSettingsMenuState extends State<AllSettingsMenu> {
  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['allSettingMenuPageText'] ?? [];
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
          child: FadeVerticalScrollView(
            child: Column(
              children: [
                SimpleAppBar(
                  leftText: idPageText?[0]['BackButton'] ?? 'No Text',
                  leftIcon: const Icon(Icons.arrow_back_ios_new_sharp),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topLeft,
                  child: GradientText(
                    text: idPageText?[0]['Header'] ?? 'No Text',
                    textStyle: StyleApp.giantTextStyle.copyWith(fontWeight: FontWeight.w900),
                    gradientColors: [Colors.purple.shade200, Colors.purple.shade300],
                  ),
                ),
                const SizedBox(height: 30,),
                ArrowButton(
                  labelButton: idPageText?[0]['ButtonMenu1'] ?? 'No Text',
                  prefixIcon: const Icon(Icons.flag, size: 20),
                  suffixIcon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  height: 50,
                  marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                  containerColor: themeColors.containerColorGrey,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  onTap: () async {
                    Get.to(const SettingsLanguage(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
                    return true;
                  }
                ),
                ArrowButton(
                  labelButton: idPageText?[0]['ButtonMenu2'] ?? 'No Text',
                  prefixIcon: const Icon(Icons.room_preferences, size: 20),
                  suffixIcon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  height: 50,
                  marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                  containerColor: themeColors.containerColorGrey,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                  onTap: () async {
                    Get.to(const SettingsPreferences(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
                    return true;
                  }
                ),
                const SizedBox(height: 30,),
                ArrowButton(
                  labelButton: idPageText?[0]['ButtonMenu90'] ?? 'No Text',
                  prefixIcon: const Icon(Icons.question_mark_rounded, size: 20),
                  suffixIcon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  height: 50,
                  marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                  containerColor: themeColors.containerColorGrey,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  onTap: () async {
                    Get.to(const SettingsAboutapp(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
                    return true;
                  }
                ),
                ArrowButton(
                  labelButton: idPageText?[0]['ButtonMenu91'] ?? 'No Text',
                  prefixIcon: const Icon(Icons.privacy_tip_rounded, size: 20),
                  suffixIcon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  height: 50,
                  marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                  containerColor: themeColors.containerColorGrey,
                  onTap: () async {
                    Get.to(const SettingsPrivacyPolicy(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
                    return true;
                  }
                ),
                ArrowButton(
                  labelButton: idPageText?[0]['ButtonMenu92'] ?? 'No Text',
                  prefixIcon: const Icon(Icons.bug_report, size: 20),
                  suffixIcon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  height: 50,
                  marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                  containerColor: themeColors.containerColorGrey,
                  onTap: () async {
                    Get.to(const SettingsReportBug(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
                    return true;
                  }
                ),
                ArrowButton(
                  labelButton: idPageText?[0]['ButtonMenu93'] ?? 'No Text',
                  prefixIcon: const Icon(Icons.call, size: 20),
                  suffixIcon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  height: 50,
                  marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                  containerColor: themeColors.containerColorGrey,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                  onTap: () async {
                    Get.to(const SettingsLanguage(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
                    return true;
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}