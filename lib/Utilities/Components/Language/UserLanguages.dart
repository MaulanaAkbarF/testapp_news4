import 'dart:developer' as dev;
import 'package:testapp_news/Utilities/Languages/EnglishUS.dart';

import '../../../PageMainapp/NewsDetail/Detail_Model.dart';
import '../../Languages/Arabic.dart';
import '../../Languages/Indonesia.dart';
import '../../Languages/Japanese.dart';

class LanguageSelected {
  final String pageModelData;
  static String selectedLanguage = '';
  late final DetailNewsModel detailNewsModel;

  LanguageSelected.detailNewsSelected(this.pageModelData, this.detailNewsModel);

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
    } else if (selectedLanguage == "ar") {
      drawerPageText = Arabic_UIText.DrawerPageText;
      bottomNavBarPageText = Arabic_UIText.BottomNavBarPageText;
      allSettingMenuPageText = Arabic_UIText.AllSettingMenuPageText;
      settingLanguagesPageText = Arabic_UIText.SettingLanguagesPageText;
      settingAboutAppPageText = Arabic_UIText.SettingAboutAppPageText;
      settingPrivacyPolicyPageText = Arabic_UIText.SettingPrivacyPolicyPageText;
      settingReportBugPageText = Arabic_UIText.SettingReportBugPageText;
      splashScreenPageText = Arabic_UIText.SplashScreenPageText;
      loginPageText = Arabic_UIText.LoginPageText;
      registerPageText = Arabic_UIText.RegisterPageText;
      dashboardPageText = Arabic_UIText.DashboardPageText;
    } else if (selectedLanguage == "en") {
      drawerPageText = EnglishUS_UIText.DrawerPageText;
      bottomNavBarPageText = EnglishUS_UIText.BottomNavBarPageText;
      allSettingMenuPageText = EnglishUS_UIText.AllSettingMenuPageText;
      settingLanguagesPageText = EnglishUS_UIText.SettingLanguagesPageText;
      settingAboutAppPageText = EnglishUS_UIText.SettingAboutAppPageText;
      settingPrivacyPolicyPageText = EnglishUS_UIText.SettingPrivacyPolicyPageText;
      settingReportBugPageText = EnglishUS_UIText.SettingReportBugPageText;
      splashScreenPageText = EnglishUS_UIText.SplashScreenPageText;
      loginPageText = EnglishUS_UIText.LoginPageText;
      registerPageText = EnglishUS_UIText.RegisterPageText;
      dashboardPageText = EnglishUS_UIText.DashboardPageText;
    } else if (selectedLanguage == "jp") {
      drawerPageText = Japanese_UIText.DrawerPageText;
      bottomNavBarPageText = Japanese_UIText.BottomNavBarPageText;
      allSettingMenuPageText = Japanese_UIText.AllSettingMenuPageText;
      settingLanguagesPageText = Japanese_UIText.SettingLanguagesPageText;
      settingAboutAppPageText = Japanese_UIText.SettingAboutAppPageText;
      settingPrivacyPolicyPageText = Japanese_UIText.SettingPrivacyPolicyPageText;
      settingReportBugPageText = Japanese_UIText.SettingReportBugPageText;
      splashScreenPageText = Japanese_UIText.SplashScreenPageText;
      loginPageText = Japanese_UIText.LoginPageText;
      registerPageText = Japanese_UIText.RegisterPageText;
      dashboardPageText = Japanese_UIText.DashboardPageText;
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

    if (selectedLanguage == "id") {
      settingPreferencesPageText = Indonesia_UIText.SettingPreferencesPageText;
    } else if (selectedLanguage == "ar") {
      settingPreferencesPageText = Arabic_UIText.SettingPreferencesPageText;
    } else if (selectedLanguage == "en") {
      settingPreferencesPageText = EnglishUS_UIText.SettingPreferencesPageText;
    } else if (selectedLanguage == "jp") {
      settingPreferencesPageText = Japanese_UIText.SettingPreferencesPageText;
    } // Salin dan tambahkan else if dari bahasa lainnya

    return {
      'settingPreferencesPageText': settingPreferencesPageText ?? [],
    };
  }

  // Fungsi non-statis (String)
  // Fungsi dibawah ini hanya untuk kumpulan data String yang diakses secara Future/non-statis
  // Penggunaan Future dapat memakan lebih banyak memori dan kinerja aplikasi daripada menggunakan Statis
  Future<Map<String, List<Map<String, String>>>> getIdPageTextAwait() async {
    List<Map<String, String>>? newsDetailPageText;

    if (selectedLanguage == "id") {
      if (pageModelData == 'dmm'){
        newsDetailPageText = await Indonesia_UIText_Await.detailNews(detailNewsModel).NewsDetailPageText();
      } else {
        dev.log('Tidak dapat menemukan kode akses', error: 'Parah', level:3);
      }
    } else if (selectedLanguage == "ar") {
      if (pageModelData == 'dmm'){
        newsDetailPageText = await Arabic_UIText_Await.detailNews(detailNewsModel).NewsDetailPageText();
      } else {
        dev.log('Tidak dapat menemukan kode akses', error: 'Parah', level:3);
      }
    } else if (selectedLanguage == "en") {
      if (pageModelData == 'dmm'){
        newsDetailPageText = await EnglishUS_UIText_Await.detailNews(detailNewsModel).NewsDetailPageText();
      } else {
        dev.log('Tidak dapat menemukan kode akses', error: 'Parah', level:3);
      }
    } else if (selectedLanguage == "jp") {
      if (pageModelData == 'dmm'){
        newsDetailPageText = await Japanese_UIText_Await.detailNews(detailNewsModel).NewsDetailPageText();
      } else {
        dev.log('Tidak dapat menemukan kode akses', error: 'Parah', level:3);
      }
    } // Salin dan tambahkan else if dari bahasa lainnya

    return {
      'newsDetailPageText': newsDetailPageText ?? [],
    };
  }
}

