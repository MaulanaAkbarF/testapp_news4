import 'package:flutter/material.dart';
import '../../../Layout/Style/Styleapp.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../Language/UserLanguages.dart';

class SettingsAboutapp extends StatefulWidget {

  const SettingsAboutapp({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsAboutapp> createState() => _SettingsAboutappState();
}

class _SettingsAboutappState extends State<SettingsAboutapp> {
  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['settingAboutAppPageText'];
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
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(idPageText?[0]['Header'] ?? 'No Text',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: StyleApp.giantTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset('assets/Icon/logo.png',
                          height: 150,
                        )
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(idPageText?[0]['Description'] ?? 'No Text',
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
