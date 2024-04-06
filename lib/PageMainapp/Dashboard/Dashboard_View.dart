import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Layout/Style/Styleapp.dart';
import '../../Layout/Style/Themeapp.dart';
import '../../Layout/Widget/DialogStyles.dart';
import '../../Layout/Widget/ListViewBuilderStyles.dart';
import '../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../Services/BackendIntegration/NewsAPI/HTTP_Request.dart';
import '../../Utilities/Components/Language/UserLanguages.dart';
import '../NewsDetail/Detail_Model.dart';
import '../NewsDetail/Detail_View.dart';
import 'Dashboard_Controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController dashboardController = DashboardController();

  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['dashboardPageText'] ?? [];
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
        child: FadeVerticalScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/Image/bgWeather.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Icon(Icons.date_range, size: 12,)),
                                    const SizedBox(width: 5,),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        dashboardController.todayDate,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: StyleApp.smallTextStyle.copyWith(color: themeColors.textColorRegular),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    idPageText?[0]['Title'] ?? 'No Text',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: StyleApp.giganticTextStyle.copyWith(color: themeColors.textColorRegular, fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              LongListViewBuilderRetrofit(
                futureSnapshot: fetchNews,
                physics: NeverScrollableScrollPhysics(),
                imagePathField: dashboardController.imagePathField,
                titleField: dashboardController.titleField,
                descField: dashboardController.descField,
                containerColor: themeColors.containerColorGrey,
                borderRadiusCircular: 10,
                onTap: (data, index) async {
                  DetailNewsModel detailNewsModel = DetailNewsModel();
                  detailNewsModel.articleDetail = data;

                  if (detailNewsModel.articleDetail != null) {
                    List<Map<String, String>> idPageText;
                    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.detailNewsSelected('dmm', detailNewsModel).getIdPageTextAwait();
                    idPageText = pageTextMap['newsDetailPageText'] ?? [];
                    Get.to(() => DetailNews(idPageText: idPageText));
                  } else {
                    return;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
