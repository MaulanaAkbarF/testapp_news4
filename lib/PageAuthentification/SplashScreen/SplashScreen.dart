import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Layout/Style/Styleapp.dart';
import '../../Layout/Widget/ButtonStyles.dart';
import '../../Layout/Widget/DialogStyles.dart';
import '../../PageMainapp/BottomNavigationBar/BottomNavigationBar.dart';
import '../../Services/SharedPreferences/Data_Users.dart';
import '../../Utilities/Components/AllSettingsMenu/AllSettingsMenu_View.dart';
import '../../Utilities/Components/Language/UserLanguages.dart';
import '../Login/Login_View.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splashscreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String imagePath = 'assets/Image/bgSplash.png';
  final String logoPath = 'assets/Icon/logo.png';

  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['splashScreenPageText'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadPageText();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        for (final teks in idPageText ?? []) {
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return RegularDialog(
                header: teks['HeaderWarning1'],
                description: teks['DescriptionWarning1'],
                declinedText: teks['DeclineButton1'],
                loadingDeclinedText: teks['LoadingDeclineButton1'],
                declinedOnTap: () async {
                  Navigator.of(context).pop();
                  return true;
                },
                acceptedText: teks['AcceptedButton1'],
                loadingAcceptedText: teks['LoadingAcceptedButton1'],
                acceptedOnTap: () async {
                  SystemNavigator.pop();
                  return true;
                },
              );
            },
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: imagePath.isNotEmpty
                      ? Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Container(),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset(logoPath, width: 200,),
                    ),
                    const SizedBox(height: 200,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimateProgressButton(
                        labelButton: idPageText?[0]['ButtonLogin'] ?? 'No Text',
                        labelProgress: idPageText?[0]['LoadingButtonLogin'] ?? 'No Text',
                        labelButtonStyle: StyleApp.extraLargeTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        containerColor: Colors.blue.shade800,
                        containerRadius: 100,
                        onTap: () async {
                          DataUsers dataUsers = DataUsers();
                          dataUsers.username = 'ESP32';
                          Get.off(const Login(), transition: Transition.circularReveal, duration: const Duration(seconds: 1));
                          return true;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimateProgressButton(
                        labelButton: idPageText?[0]['ButtonSettings'] ?? 'No Text',
                        labelProgress: idPageText?[0]['LoadingButtonSettings'] ?? 'No Text',
                        labelButtonStyle: StyleApp.extraLargeTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        containerColor: Colors.blue.shade800,
                        containerRadius: 100,
                        onTap: () async {
                          Get.to(const AllSettingsMenu(), transition: Transition.circularReveal, duration: const Duration(milliseconds: 500));
                          return true;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              for (final teks in idPageText ?? [])
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                                text: teks['VersionText'],
                                style: StyleApp.microTextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            const WidgetSpan(
                              child: SizedBox(width: 3),
                            ),
                            TextSpan(
                                text: teks['CopyrightText'],
                                style: StyleApp.microTextStyle.copyWith(
                                  color: Colors.white,
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
