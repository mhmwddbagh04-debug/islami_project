import 'package:flutter/material.dart';
import 'package:islami/themes/colors.dart';
import 'package:islami/ui/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/ui/tabs/home_tab/home_tab.dart';
import 'package:islami/ui/tabs/sebha_tab/sebha_tab.dart';
import '../themes/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    HadethTab(),
    SebhaTab()
,
    Container(color: Colors.grey),
    Container(color: Colors.yellow),
  ];
  late PageController pageController = PageController(
    initialPage: selectedIndex,
  );

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (((pageController.page ?? 0) % 1) > 0.5) {
        selectedIndex = (pageController.page ?? 0).toInt() + 1;
      } else {
        selectedIndex = (pageController.page ?? 0).toInt();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView(controller: pageController, children: tabs),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.gold,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyles.bodySmallStyle(),
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          if (newIndex == selectedIndex) return;
          selectedIndex = newIndex;
          pageController.jumpToPage(selectedIndex);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon(
              'assets/images/ic_quran.png',
              0,
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon(
              'assets/images/ic_hadeth.png',
              1,
            ),

            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon('assets/images/sebha.png', 2),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon('assets/images/radio.png', 3),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavigationBarIcon('assets/images/timer.png', 4),
            label: 'Time',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarIcon(String imagePath, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: index == selectedIndex
          ? BoxDecoration(
              color: AppColors.black.withAlpha(50),
              borderRadius: BorderRadius.circular(40),
            )
          : null,
      child: ImageIcon(AssetImage(imagePath)),
    );
  }
}
