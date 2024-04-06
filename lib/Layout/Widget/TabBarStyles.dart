import 'package:flutter/material.dart';

import '../Style/Styleapp.dart';
import '../Style/Themeapp.dart';

class RegularTabBar extends StatelessWidget {
  final List<String> menu;
  final List<Widget> child;
  final TextStyle? menuTextStyle;
  final int tabLength;
  final bool isScrollable;
  final EdgeInsets? padding;
  final Future<bool> Function(dynamic)? onPopInvoked;

  const RegularTabBar({
    Key? key,
    required this.menu,
    required this.child,
    this.menuTextStyle,
    required this.tabLength,
    this.isScrollable = false,
    this.padding,
    this.onPopInvoked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        await onPopInvoked?.call(didPop) ?? false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: SafeArea(
          child: DefaultTabController(
            length: tabLength,
            child: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: padding ?? const EdgeInsets.only(top: 10),
                    child: TabBar(
                      isScrollable: isScrollable,
                      labelPadding: EdgeInsets.zero,
                      tabs: menu.map((menu) => Tab(
                        child: Text(
                          menu,
                          style: menuTextStyle ?? StyleApp.mediumTextStyle.copyWith(
                            color: themeColors.textColorRegular
                          ),
                        ),
                      )).toList(),
                    )
                  ),
                  Expanded(
                    child: TabBarView(
                      children: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


