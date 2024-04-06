import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Layout/Style/Styleapp.dart';
import '../../Layout/Style/Themeapp.dart';
import '../../Layout/Widget/DrawerStyles.dart';
import '../../Layout/Widget/TextStyles.dart';
import '../../Utilities/Components/AllSettingsMenu/AllSettingsMenu_View.dart';
import '../../Services/SharedPreferences/Data_Users.dart';
import '../../Utilities/Components/Language/UserLanguages.dart';
import '../Dashboard/Dashboard_View.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final DataUsers dataUsers;

  const CustomBottomNavigationBar({
    Key? key,
    required this.dataUsers
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late DataUsers dataUsers;
  int _selectedIndex = 0;
  List<String> items = [];
  List<Map<String, String>>? idPageText;
  final _pageController = PageController();

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['bottomNavBarPageText'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadPageText();
    dataUsers = widget.dataUsers;
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Scaffold(
      drawer: RegularDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: themeColors.containerColorLightBlue,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Builder(
                      builder: (context) => GestureDetector(
                          onTap: (){
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(Icons.format_list_bulleted_sharp, size: 20,)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                        text: '${idPageText?[0]['GreetingLabel'] ?? ''} ${dataUsers.username ?? ''}',
                        maxLines: 1,
                        textStyle: StyleApp.largeTextStyle.copyWith(),
                        gradientColors: [Colors.blue.shade200, Colors.white],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Builder(
                      builder: (context) => GestureDetector(
                          onTap: (){
                            Get.to(const AllSettingsMenu(), transition: Transition.circularReveal, duration: const Duration(milliseconds: 500));
                          },
                          child: const Icon(Icons.settings, size: 20,)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: _getPages(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildBottomNavigationBarItem(Icons.newspaper, idPageText?[0]['Page1Label'] ?? ''),
          _buildBottomNavigationBarItem(Icons.trending_up_sharp, idPageText?[0]['Page2Label'] ?? ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade100,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: _selectedIndex == items.indexOf(label) ? 38.0 : 30.0,
        child: Icon(
          icon,
          size: _selectedIndex == items.indexOf(label) ? 30.0 : 24.0,
        ),
      ),
      label: label,
    );
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  List<Widget> _getPages() {
    return [
      const Dashboard(),
    ];
  }
}