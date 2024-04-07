import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Layout/Style/Styleapp.dart';
import '../Language/UserLanguages.dart';

class SettingsPreferencesController {
  static String selectedStringFontSize = '';
  static String selectedFontFamily = '';
  static double selectedThemeId = 0;
  static String selectedStringTheme = '';
  RxBool isChange = false.obs;
  List<Map<String, List<String>>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, List<String>>>> pageTextMap = await LanguageSelected.getIdPageTextListString();
    idPageText = pageTextMap['settingPreferencesPageText'] ?? [];
  }

  Future<void> setFont() async {
    await loadPageText();
    if (SettingsPreferencesController.selectedFontFamily == idPageText![0]['ButtonMenu1Dropdown']![0]){
      StyleApp.fontFamily = 'Segoe UI';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedMenu1Dropdown', StyleApp.fontFamily);
    } else if (SettingsPreferencesController.selectedFontFamily == idPageText![0]['ButtonMenu1Dropdown']![1]){
      StyleApp.fontFamily = 'Arial Narrow';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedMenu1Dropdown', StyleApp.fontFamily);
    } else if (SettingsPreferencesController.selectedFontFamily == idPageText![0]['ButtonMenu1Dropdown']![2]){
      StyleApp.fontFamily = 'Cinzel';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedMenu1Dropdown', StyleApp.fontFamily);
    } else if (SettingsPreferencesController.selectedFontFamily == idPageText![0]['ButtonMenu1Dropdown']![3]){
      StyleApp.fontFamily = 'Inter';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedMenu1Dropdown', StyleApp.fontFamily);
    } else if (SettingsPreferencesController.selectedFontFamily == idPageText![0]['ButtonMenu1Dropdown']![4]){
      StyleApp.fontFamily = 'Peristiwa';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedMenu1Dropdown', StyleApp.fontFamily);
    } else if (SettingsPreferencesController.selectedFontFamily == idPageText![0]['ButtonMenu1Dropdown']![5]){
      StyleApp.fontFamily = 'Playball';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedMenu1Dropdown', StyleApp.fontFamily);
    }
  }

  Future<void> setStringFontSize() async {
    await loadPageText();
    if (StyleApp.fontSize == 14){
      SettingsPreferencesController.selectedStringFontSize = idPageText![0]['ButtonMenu2Dropdown']![0];
    } else if (StyleApp.fontSize == 16){
      SettingsPreferencesController.selectedStringFontSize = idPageText![0]['ButtonMenu2Dropdown']![1];
    } else if (StyleApp.fontSize == 18){
      SettingsPreferencesController.selectedStringFontSize = idPageText![0]['ButtonMenu2Dropdown']![2];
    } else if (StyleApp.fontSize == 20){
      SettingsPreferencesController.selectedStringFontSize = idPageText![0]['ButtonMenu2Dropdown']![3];
    } else if (StyleApp.fontSize == 22){
      SettingsPreferencesController.selectedStringFontSize = idPageText![0]['ButtonMenu2Dropdown']![4];
    }
  }

  Future<void> setSize() async {
    await loadPageText();
    if (SettingsPreferencesController.selectedStringFontSize == idPageText![0]['ButtonMenu2Dropdown']![0]){
      StyleApp.fontSize = 14;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu2Dropdown', StyleApp.fontSize);
    } else if (SettingsPreferencesController.selectedStringFontSize == idPageText![0]['ButtonMenu2Dropdown']![1]){
      StyleApp.fontSize = 16;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu2Dropdown', StyleApp.fontSize);
    } else if (SettingsPreferencesController.selectedStringFontSize == idPageText![0]['ButtonMenu2Dropdown']![2]){
      StyleApp.fontSize = 18;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu2Dropdown', StyleApp.fontSize);
    } else if (SettingsPreferencesController.selectedStringFontSize == idPageText![0]['ButtonMenu2Dropdown']![3]){
      StyleApp.fontSize = 20;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu2Dropdown', StyleApp.fontSize);
    } else if (SettingsPreferencesController.selectedStringFontSize == idPageText![0]['ButtonMenu2Dropdown']![4]){
      StyleApp.fontSize = 22;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu2Dropdown', StyleApp.fontSize);
    }
  }

  Future<void> setStringTheme() async {
    await loadPageText();
    if (SettingsPreferencesController.selectedThemeId == 0){
      SettingsPreferencesController.selectedStringTheme = idPageText![0]['ButtonMenu3Dropdown']![0];
    } else if (SettingsPreferencesController.selectedThemeId == 1){
      SettingsPreferencesController.selectedStringTheme = idPageText![0]['ButtonMenu3Dropdown']![1];
    } else if (SettingsPreferencesController.selectedThemeId == 2){
      SettingsPreferencesController.selectedStringTheme = idPageText![0]['ButtonMenu3Dropdown']![2];
    } else if (SettingsPreferencesController.selectedThemeId == 3){
      SettingsPreferencesController.selectedStringTheme = idPageText![0]['ButtonMenu3Dropdown']![3];
    }
  }

  Future<void> setTheme() async {
    await loadPageText();
    if (SettingsPreferencesController.selectedStringTheme == idPageText![0]['ButtonMenu3Dropdown']![0]){
      SettingsPreferencesController.selectedThemeId = 0;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu3Dropdown', SettingsPreferencesController.selectedThemeId);
    } else if (SettingsPreferencesController.selectedStringTheme == idPageText![0]['ButtonMenu3Dropdown']![1]){
      SettingsPreferencesController.selectedThemeId = 1;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu3Dropdown', SettingsPreferencesController.selectedThemeId);
    } else if (SettingsPreferencesController.selectedStringTheme == idPageText![0]['ButtonMenu3Dropdown']![2]){
      SettingsPreferencesController.selectedThemeId = 2;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu3Dropdown', SettingsPreferencesController.selectedThemeId);
    } else if (SettingsPreferencesController.selectedStringTheme == idPageText![0]['ButtonMenu3Dropdown']![3]){
      SettingsPreferencesController.selectedThemeId = 3;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('selectedMenu3Dropdown', SettingsPreferencesController.selectedThemeId);
    }
  }
}