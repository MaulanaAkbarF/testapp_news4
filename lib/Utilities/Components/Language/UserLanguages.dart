import 'dart:developer' as dev;
import '../../Languages/EnglishUS.dart';
import '../../Languages/Indonesia.dart';
import '../../Languages/Japanese.dart';

class LanguageSelected {
  // final String pageModelData;
  static String selectedLanguage = '';
  // late final DetailMonitoringModel detailMonitoringModel;
  // late final DetectionModel detectionModel;

  // LanguageSelected.detailMonitoringSelected(this.pageModelData, this.detailMonitoringModel);
  // LanguageSelected.detailDetectionSelected(this.pageModelData, this.detectionModel);

  // Fungsi statis (String)
  // Fungsi dibawah ini hanya untuk kumpulan data String yang diakses secara statis
  // Penggunaan statis dapat mempercepat kinerja aplikasi dan mengurangi penggunaan memori yang tidak perlu
  static Future<Map<String, List<Map<String, String>>>> getIdPageText() async {
    List<Map<String, String>>? drawerPageText;
    List<Map<String, String>>? bottomNavBarPageText;
    List<Map<String, String>>? allSettingMenuPageText;
    List<Map<String, String>>? settingLanguagesPageText;
    List<Map<String, String>>? settingAboutAppPageText;
    List<Map<String, String>>? settingPrivacyPolicyPageText;
    List<Map<String, String>>? settingReportBugPageText;

    List<Map<String, String>>? splashScreenPageText;
    List<Map<String, String>>? loginPageText;
    List<Map<String, String>>? registerPageText;
    List<Map<String, String>>? dashboardPageText;
    // Tambahkan List<Map<String, String>>? dari bahasa lainnya

    if (selectedLanguage == "id") {
      drawerPageText = Indonesia_UIText.DrawerPageText;
      bottomNavBarPageText = Indonesia_UIText.BottomNavBarPageText;
      allSettingMenuPageText = Indonesia_UIText.AllSettingMenuPageText;
      settingLanguagesPageText = Indonesia_UIText.SettingLanguagesPageText;
      settingAboutAppPageText = Indonesia_UIText.SettingAboutAppPageText;
      settingPrivacyPolicyPageText = Indonesia_UIText.SettingPrivacyPolicyPageText;
      settingReportBugPageText = Indonesia_UIText.SettingReportBugPageText;
      splashScreenPageText = Indonesia_UIText.SplashScreenPageText;
      loginPageText = Indonesia_UIText.LoginPageText;
      registerPageText = Indonesia_UIText.RegisterPageText;
      dashboardPageText = Indonesia_UIText.DashboardPageText;
    } else if (selectedLanguage == "en") {

    } else if (selectedLanguage == "jp") {

    } // Salin dan tambahkan else if dari bahasa lainnya

    return {
      'drawerPageText': drawerPageText ?? [],
      'bottomNavBarPageText': bottomNavBarPageText ?? [],
      'allSettingMenuPageText': allSettingMenuPageText ?? [],
      'settingLanguagesPageText': settingLanguagesPageText ?? [],
      'settingAboutAppPageText': settingAboutAppPageText ?? [],
      'settingPrivacyPolicyPageText': settingPrivacyPolicyPageText ?? [],
      'settingReportBugPageText': settingReportBugPageText ?? [],

      'splashScreenPageText': splashScreenPageText ?? [],
      'loginPageText': loginPageText ?? [],
      'registerPageText': registerPageText ?? [],
      'dashboardPageText': dashboardPageText ?? [],
    };
  }

  // Fungsi statis (List String)
  // Fungsi dibawah ini hanya untuk kumpulan data List String yang diakses secara statis
  // Penggunaan List String dapat memakan lebih banyak memori dan kinerja aplikasi daripada menggunakan String
  static Future<Map<String, List<Map<String, List<String>>>>> getIdPageTextListString() async {
    List<Map<String, List<String>>>? settingPreferencesPageText;
    // Tambahkan List<Map<String, String>>? dari bahasa lainnya

    if (selectedLanguage == "id") {
      settingPreferencesPageText = Indonesia_UIText.SettingPreferencesPageText;
    } else if (selectedLanguage == "en") {

    } else if (selectedLanguage == "jp") {

    } // Salin dan tambahkan else if dari bahasa lainnya

    return {
      'settingPreferencesPageText': settingPreferencesPageText ?? [],
    };
  }
}

