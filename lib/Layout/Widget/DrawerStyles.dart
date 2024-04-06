import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../PageAuthentification/SplashScreen/SplashScreen.dart';
import '../../Utilities/Components/Language/UserLanguages.dart';
import '../Style/Styleapp.dart';
import '../Style/Themeapp.dart';
import 'SingleChildScrollStyles.dart';

class RegularDrawer extends StatefulWidget {
  final String imagePath;

  RegularDrawer({
    super.key,
    this.imagePath = 'assets/Image/myonion.png'
  });

  @override
  State<RegularDrawer> createState() => _RegularDrawerState();
}

class _RegularDrawerState extends State<RegularDrawer> {
  // final SprinklingController sprinklingController = SprinklingController();
  // final ServerStream serverStream = ServerStream();

  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['drawerPageText'];
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

    return Drawer(
        child: SafeArea(
          child: AnimateFadeVerticalScrollView(
            xStart: 40.0,
            xEnd: 0.0,
            child: Column(
              children: [
                for (final teks in idPageText ?? [])
                  Column(
                    children: [
                      const SizedBox(height: 10,),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Image.asset(widget.imagePath, height: 30,),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: themeColors.containerColorGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(teks['ServerLabel'],
                                            style: StyleApp.mediumTextStyle.copyWith(
                                              color: themeColors.textColorRegular,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          // child: serverStream.buildStreamBuilderServer(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(teks['MachineLabel'],
                                            style: StyleApp.mediumTextStyle.copyWith(
                                              color: themeColors.textColorRegular,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          // child: serverStream.buildStreamBuilderDeteksi(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(teks['ResponseLabel'],
                                            style: StyleApp.mediumTextStyle.copyWith(
                                              color: themeColors.textColorRegular,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(teks['Response'],
                                            style: StyleApp.largeTextStyle.copyWith(color: themeColors.containerColorDarkPurple, fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50,),
                      InkWell(
                        highlightColor: Colors.blue.withOpacity(0.6),
                        onTap: () async {
                          // await sprinklingController.setLamaPenyiramanToFirebase(0);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeColors.containerColorDarkPurple,
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.timer),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(teks['StopSprinklingButton'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: StyleApp.semiLargeTextStyle.copyWith(
                                      color: themeColors.textColorRegular,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                      InkWell(
                        highlightColor: Colors.blue.withOpacity(0.6),
                        onTap: () {
                          Get.off(() => const SplashScreen(), transition: Transition.circularReveal, duration: const Duration(seconds: 1));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: themeColors.containerColorDarkPurple,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.sensor_window_outlined),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(teks['BackToSplashScreenButton'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: StyleApp.semiLargeTextStyle.copyWith(
                                      color: themeColors.textColorRegular,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        highlightColor: Colors.blue.withOpacity(0.6),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: themeColors.containerColorDarkPurple,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.hide_image_outlined),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(teks['CloseDrawerButton'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: StyleApp.semiLargeTextStyle.copyWith(
                                      color: themeColors.textColorRegular,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        )
    );
  }
}
