import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../Layout/Style/Styleapp.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Layout/Widget/ButtonStyles.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../../../Layout/Widget_Obnutries/ContainerSettingsStyles.dart';
import '../Language/UserLanguages.dart';
import 'SettingsPreferences_Controller.dart';

class SettingsPreferences extends StatefulWidget {
  const SettingsPreferences({super.key});

  @override
  State<SettingsPreferences> createState() => SettingsPreferencesState();
}

class SettingsPreferencesState extends State<SettingsPreferences> {
  SettingsPreferencesController settingsPreferencesController = SettingsPreferencesController();
  String? labeldesc;
  List<Map<String, List<String>>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, List<String>>>> pageTextMap = await LanguageSelected.getIdPageTextListString();
    setState(() {
      idPageText = pageTextMap['settingPreferencesPageText'] ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    loadPageText();
    settingsPreferencesController.setStringFontSize();
    settingsPreferencesController.setStringTheme();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Scaffold(
      body: PopScope(
        canPop: true,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: FadeVerticalScrollView(
                  child: Column(
                    children: [
                      SimpleAppBar(
                        leftText: idPageText?[0]['BackButton']?[0] ?? 'No Text',
                        leftIcon: const Icon(Icons.arrow_back_ios_new_sharp),
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GradientText(
                          text: idPageText?[0]['Header']?[0] ?? 'No Text',
                          textStyle: StyleApp.giantTextStyle.copyWith(fontWeight: FontWeight.w400),
                          gradientColors: [Colors.red.shade200, Colors.red.shade400],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          idPageText?[0]['SubHeader']?[0] ?? 'No Text',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: StyleApp.mediumTextStyle.copyWith(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      SettingMenuDropdown(
                        labelButton: idPageText?[0]['ButtonMenu1']?[0] ?? 'No Text',
                        prefixIcon: const Icon(Icons.font_download, size: 20),
                        height: 60,
                        marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                        containerColor: themeColors.containerColorGrey,
                        items: idPageText?[0]['ButtonMenu1Dropdown'] ?? [],
                        value: SettingsPreferencesController.selectedFontFamily,
                        onChanged: (String? newValue) {
                          setState(() {
                            SettingsPreferencesController.selectedFontFamily = newValue!;
                            settingsPreferencesController.setFont();
                            settingsPreferencesController.isChange.value = true;
                          });
                        },
                      ),
                      SettingMenuDropdown(
                        labelButton: idPageText?[0]['ButtonMenu2']?[0] ?? 'No Text',
                        prefixIcon: const Icon(Icons.format_size_rounded, size: 20),
                        height: 60,
                        marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                        containerColor: themeColors.containerColorGrey,
                        items: idPageText?[0]['ButtonMenu2Dropdown'] ?? [],
                        value: SettingsPreferencesController.selectedStringFontSize,
                        onChanged: (String? newValue) {
                          setState(() {
                            SettingsPreferencesController.selectedStringFontSize = newValue!;
                            settingsPreferencesController.setSize();
                            settingsPreferencesController.isChange.value = true;
                          });
                        },
                      ),
                      const SizedBox(height: 30,),
                      SettingMenuDropdown(
                        labelButton: idPageText?[0]['ButtonMenu3']?[0] ?? 'No Text',
                        prefixIcon: const Icon(Icons.light_mode_rounded, size: 20),
                        height: 60,
                        marginButtonLabel: const EdgeInsets.symmetric(horizontal: 10),
                        borderRadius: BorderRadius.circular(10),
                        containerColor: themeColors.containerColorGrey,
                        items: idPageText?[0]['ButtonMenu3Dropdown'] ?? [],
                        value: SettingsPreferencesController.selectedStringTheme,
                        onChanged: (String? newValue) {
                          setState(() {
                            SettingsPreferencesController.selectedStringTheme = newValue!;
                            settingsPreferencesController.setTheme();
                            settingsPreferencesController.isChange.value = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (settingsPreferencesController.isChange.value) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              idPageText?[0]['LabelRestart']?[0] ?? 'No Text',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: StyleApp.mediumTextStyle.copyWith(
                                  color: themeColors.textColorRegular
                              ),
                            ),
                          ),
                          AnimateProgressButton(
                            labelButton: idPageText?[0]['ButtonRestart']?[0] ?? 'No Text',
                            labelProgress: idPageText?[0]['ButtonRestart']?[0] ?? 'No Text',
                            width: 150,
                            height: 30,
                            margin: const EdgeInsets.only(left: 10),
                            containerColor: themeColors.containerColorGrey,
                            containerRadius: 50,
                            onTap: () async {
                              _performExitAction();
                              return true;
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
  void _performExitAction() {
    SystemNavigator.pop();
  }
}