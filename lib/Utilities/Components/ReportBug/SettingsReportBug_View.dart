import 'package:flutter/material.dart';
import '../../../Layout/Style/Styleapp.dart';
import '../../../Layout/Style/Themeapp.dart';
import '../../../Layout/Widget/ListViewBuilderStyles.dart';
import '../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../Layout/Widget/TextFormFieldStyles.dart';
import '../../../Layout/Widget/TextStyles.dart';
import '../Language/UserLanguages.dart';
import 'SettingsReportBug_Controller.dart';

class SettingsReportBug extends StatefulWidget {
  const SettingsReportBug({super.key});

  @override
  State<SettingsReportBug> createState() => SettingsReportBugState();
}

class SettingsReportBugState extends State<SettingsReportBug> {
  final SettingsReportBugController settingsReportBugController = SettingsReportBugController();
  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['settingReportBugPageText'] ?? [];
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
                    textStyle: StyleApp.giantTextStyle.copyWith(fontWeight: FontWeight.w400),
                    gradientColors: [Colors.yellow.shade200, Colors.yellow.shade400],
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
                const SizedBox(height: 30,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(idPageText?[0]['SubText1'] ?? 'No Text',
                    textAlign: TextAlign.justify,
                    style: StyleApp.extraLargeTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Column(
                  children: [
                    ArrowListViewBuilderFirestore(
                      streamQuerySnapshot: settingsReportBugController.allReportsFuture,
                      timeInfoField: settingsReportBugController.time,
                      descField: settingsReportBugController.description,
                      containerColor: Colors.transparent,
                      borderRadiusCircular: 10,
                      borderColor: themeColors.containerColorGrey,
                      gradientStart: Colors.purpleAccent,
                      gradientEnd: Colors.blue,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: themeColors.containerColorGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: (){

                            },
                            icon: const Icon(Icons.add),
                            color: themeColors.containerColorDarkPurple,
                          ),
                          Flexible(
                            child: AnimateTextField(
                              controller: settingsReportBugController.reportController,
                              labelText: idPageText?[0]['TextFieldHint'] ?? 'No Text',
                              containerColor: themeColors.containerColorGrey,
                              containerRadius: 5,
                              borderAnimationColor: Colors.green.shade100,
                              borderAnimationRadius: 5,
                            ),
                          ),
                          IconButton(
                            onPressed: (){

                            },
                            icon: const Icon(Icons.send),
                            color: themeColors.containerColorDarkBlue,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(idPageText?[0]['SubText2'] ?? 'No Text',
                    textAlign: TextAlign.justify,
                    style: StyleApp.extraLargeTextStyle.copyWith(
                        color: themeColors.textColorRegular,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ArrowListViewBuilderFirestore(
                  streamQuerySnapshot: settingsReportBugController.allReportsFuture,
                  physics: const NeverScrollableScrollPhysics(),
                  timeInfoField: settingsReportBugController.time,
                  descField: settingsReportBugController.description,
                  containerColor: Colors.transparent,
                  borderRadiusCircular: 10,
                  borderColor: themeColors.containerColorDarkBlue,
                  borderOpacity: 0.5,
                  gradientStart: Colors.purpleAccent,
                  gradientEnd: Colors.blue,
                  // onTap: (data, index) async {
                  //
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}