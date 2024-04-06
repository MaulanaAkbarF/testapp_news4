import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Layout/Style/Styleapp.dart';
import 'PageAuthentification/SplashScreen/SplashScreen.dart';
import 'Services/BackendIntegration/FirebaseAuth/firebase_options.dart';
import 'Utilities/Components/Language/SettingsLanguages_Controller.dart';
import 'Utilities/Components/Language/UserLanguages.dart';
import 'Utilities/Components/Preferences/SettingsPreferences_Controller.dart';

late Brightness brightnessTheme;
late Brightness brightnessDarkTheme;
late bool trueBlack;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadPreference();
  setThemeMode();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageBloc(),
      child: BlocListener<LanguageBloc, LanguageState>(
        listener: (context, state) {
          if (state is LanguageRestart) {
            RestartWidget.restartApp(context);
          }
        },
        child: GetMaterialApp(
          title: 'MyOnion',
          initialRoute: SplashScreen.routeName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: brightnessTheme,
          ),
          darkTheme: ThemeData(
            brightness: brightnessDarkTheme,
            colorScheme: trueBlack ? ColorScheme.dark().copyWith(
              background: Colors.black,
              surface: Colors.black,
            ) : null,
          ),
          themeMode: ThemeMode.system,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
          },
        ),
      ),
    );
  }
}

Future<void> loadPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString('languageCode') ?? 'id';
  LanguageSelected.selectedLanguage = languageCode;

  String selectedMenu1Dropdown = prefs.getString('selectedMenu1Dropdown') ?? 'Segoe UI';
  double selectedMenu2Dropdown = prefs.getDouble('selectedMenu2Dropdown') ?? 18;
  double selectedMenu3Dropdown = prefs.getDouble('selectedMenu3Dropdown') ?? 2;
  SettingsPreferencesController.selectedFontFamily = selectedMenu1Dropdown;
  SettingsPreferencesController.selectedThemeId = selectedMenu3Dropdown;
  StyleApp.fontFamily = selectedMenu1Dropdown;
  StyleApp.fontSize = selectedMenu2Dropdown;
}

void setThemeMode() {
  if (SettingsPreferencesController.selectedThemeId == 0){
    brightnessTheme = Brightness.light;
    brightnessDarkTheme = Brightness.light;
    trueBlack = false;
  } else if (SettingsPreferencesController.selectedThemeId == 1){
    brightnessTheme = Brightness.dark;
    brightnessDarkTheme = Brightness.dark;
    trueBlack = false;
  } else if (SettingsPreferencesController.selectedThemeId == 2){
    brightnessTheme = Brightness.light;
    brightnessDarkTheme = Brightness.dark;
    trueBlack = false;
  } else if (SettingsPreferencesController.selectedThemeId == 3){
    brightnessTheme = Brightness.light;
    brightnessDarkTheme = Brightness.dark;
    trueBlack = true;
  }
}

class RestartWidget extends StatefulWidget {
  final Widget child;
  const RestartWidget({
    super.key,
    required this.child}
      );

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()?.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

