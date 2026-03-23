import 'package:flutter/material.dart';
import 'package:islami/onboard/screen_five.dart';
import 'package:islami/onboard/screen_four.dart';
import 'package:islami/onboard/screen_three.dart';
import 'package:islami/onboard/screen_tow.dart';
import 'package:islami/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes/text_styles.dart';
import '../ui/home_view.dart';
import 'Screen_one.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static const String routeName = 'onboardScreen';

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          SafeArea(
            child: Image.asset('assets/images/app_home.png', width: width * .7),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: [
                ScreenOne(),
                ScreenTow(),
                ScreenThree(),
                ScreenFour(),
                ScreenFive(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(19.0),

            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.decelerate,

                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      index == 0 ? '' : 'Back',
                      style: TextStyles.labelLargeStyle(color: AppColors.gold),
                    ),
                  ),
                ),
                Spacer(),
                CustomIndicator(isActive: index == 0),
                CustomIndicator(isActive: index == 1),
                CustomIndicator(isActive: index == 2),
                CustomIndicator(isActive: index == 3),
                CustomIndicator(isActive: index == 4),
                Spacer(),

                InkWell(
                  onTap: () async {
                    if (index == 4) {
                      Navigator.pushReplacementNamed(
                        context,
                        HomeScreen.routeName,
                      );
                      SharedPreferences done = await SharedPreferences.getInstance();
                      await done.setBool('onboarding_done', true);
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      index == 4 ? 'Finish' : 'Next',
                      style: TextStyles.labelLargeStyle(color: AppColors.gold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isActive ? AppColors.gold : AppColors.gray,
      ),
      width: isActive ? 30 : 10,
      height: 10,
    );
  }
}
