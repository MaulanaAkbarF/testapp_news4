import 'package:flutter/material.dart';

import '../../../../Layout/Style/Styleapp.dart';
import '../../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../../Layout/Widget/TextStyles.dart';
import '../../Layout/Style/Themeapp.dart';

class DetailNews extends StatefulWidget {
  final List<Map<String, String>> idPageText;

  const DetailNews({
    Key? key,
    required this.idPageText
  }) : super(key: key);

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  late List<Map<String, String>> idPageText;

  @override
  void initState() {
    super.initState();
    idPageText = widget.idPageText;
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Scaffold(
      body: PopScope(
        canPop: true,
        child: SafeArea(
          child: AnimateFadeVerticalScrollView(
            yStart: -30.0,
            yEnd: 0.0,
            child: Column(
              children: [
                for (final teks in idPageText ?? [])
                  Column(
                    children: [
                      const SizedBox(height: 10,),
                      SimpleAppBar(
                        leftText: teks['BackButton'],
                        leftIcon: const Icon(Icons.arrow_back_ios_new_sharp),
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          teks['TitleNews'],
                          style: StyleApp.giantTextStyle.copyWith(
                            color: themeColors.textColorRegular,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          teks['AuthorNews'],
                          style: StyleApp.largeTextStyle.copyWith(
                            color: themeColors.textColorRegular,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          teks['DateNews'],
                          style: StyleApp.mediumTextStyle.copyWith(
                            color: themeColors.textColorRegular,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: teks['ImagePath'] != null ? Image.network(
                            teks['ImagePath'],
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/Icon/logo.png',
                              ) as Widget;
                            },
                          ) : Container(),
                      ),
                      const SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(teks['DescriptionNews'],
                          style: StyleApp.largeTextStyle.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(teks['ContentNews'],
                          textAlign: TextAlign.justify,
                          style: StyleApp.largeTextStyle.copyWith(
                            color: themeColors.textColorRegular,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
