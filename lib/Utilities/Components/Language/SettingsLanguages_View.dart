import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Layout/Style/Styleapp.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Layout/Widget/ButtonStyles.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../../../PageAuthentification/SplashScreen/SplashScreen.dart';
import 'SettingsLanguages_Controller.dart';
import 'UserLanguages.dart';

class SettingsLanguage extends StatefulWidget {

  const SettingsLanguage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsLanguage> createState() => _SettingsLanguageState();
}

class _SettingsLanguageState extends State<SettingsLanguage> {
  SettingsLanguageController settingsLanguageController = SettingsLanguageController();
  // final DetectionDetailController detectionDetailController = DetectionDetailController();
  RxString languageSelectedId = ''.obs;
  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['settingLanguagesPageText'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadPageText();
    SettingsLanguageController.languageIdSelected = LanguageSelected.selectedLanguage;
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
                for (final teks in idPageText ?? [])
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    SimpleAppBar(
                      leftText: teks['BackButton'],
                      leftIcon: const Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          teks['Header'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: StyleApp.giantTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimateFlagButton(
                        labelButton: 'Indonesia',
                        labelButtonStyle: StyleApp.extraLargeTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                        image: Image.asset('assets/Icon/flagIndonesia.png', height: 20,),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        borderColor: Colors.deepPurpleAccent,
                        containerRadius: 100,
                        onTap: () async {
                          SettingsLanguageController.languageIdSelected = 'id';
                          languageSelectedId.value = 'Indonesia';
                          return true;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimateFlagButton(
                        labelButton: 'Arabic',
                        labelButtonStyle: StyleApp.extraLargeTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                        image: Image.asset('assets/Icon/flagArabic.png', height: 20,),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        borderColor: Colors.deepPurpleAccent,
                        containerRadius: 100,
                        onTap: () async {
                          SettingsLanguageController.languageIdSelected = 'ar';
                          languageSelectedId.value = 'Arabic';
                          return true;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimateFlagButton(
                        labelButton: 'English US',
                        labelButtonStyle: StyleApp.extraLargeTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                        image: Image.asset('assets/Icon/flagUSA.png', height: 20,),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        borderColor: Colors.deepPurpleAccent,
                        containerRadius: 100,
                        onTap: () async {
                          SettingsLanguageController.languageIdSelected = 'en';
                          languageSelectedId.value = 'English US';
                          return true;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimateFlagButton(
                        labelButton: 'Japanese',
                        labelButtonStyle: StyleApp.extraLargeTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                        image: Image.asset('assets/Icon/flagJapan.png', height: 20,),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        borderColor: Colors.deepPurpleAccent,
                        containerRadius: 100,
                        onTap: () async {
                          SettingsLanguageController.languageIdSelected = 'jp';
                          languageSelectedId.value = 'Japanese';
                          return true;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Align(
                        alignment: Alignment.center,
                        child: Obx(() => Text('\n${languageSelectedId.value}',
                          textAlign: TextAlign.center,
                          style: StyleApp.mediumTextStyle.copyWith(
                            color: themeColors.textColorRegular,
                          ),
                        ),
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimateProgressButton(
                        labelButton: teks['ButtonSettings'],
                        labelProgress: teks['LoadingButtonSettings'],
                        labelButtonStyle: StyleApp.extraLargeTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        containerColor: Colors.purpleAccent,
                        containerRadius: 100,
                        onTap: () async {
                          LanguageSelected.selectedLanguage = SettingsLanguageController.languageIdSelected;
                          settingsLanguageController.saveLanguagePreference(SettingsLanguageController.languageIdSelected, context);
                          Get.off(const SplashScreen(), transition: Transition.circularReveal, duration: const Duration(seconds: 1));
                          return true;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
