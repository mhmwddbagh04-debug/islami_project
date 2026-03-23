import 'dart:math';
import 'package:animate_do/animate_do.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/widgets/background_widget.dart';

import '../../../themes/colors.dart';
import '../../../themes/text_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotation = 0;
  int word = 0;
  List<String> words = ["سبحان الله", "الحمد لله", "الله أكبر"];

  void _incCounter() {
    setState(() {
      if (counter == 33) {
        counter = 0;
      }
      counter++;
      rotation += (2 * pi) / 33;
      if (counter % 33 == 0) {
        word++;
        if (word == 3) {
          word = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BackgroundWidget(
      imagePath: 'assets/images/sebha_bg.png',
      child: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/app_home.png', width: width * .6),
              ],
            ),
          ),

          SizedBox(height: 30),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: TextStyles.labelLargeStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Image.asset('assets/images/Group 37.png', height: 100),

          InkWell(
            onTap: _incCounter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: rotation / (2 * pi),
                  duration: const Duration(milliseconds: 300),

                  child: Image.asset(
                    'assets/images/SebhaBody 1.png',
                    height: 350,
                  ),
                ),
                Column(
                  spacing: 18,
                  children: [
                    Text(
                      words[word],
                      style: TextStyles.titleLargeStyle(color: AppColors.white),
                    ),

                    ZoomIn(
                      key: ValueKey(counter), // عشان يعيد الأنيميشن عند التغيير
                      child: Text(
                        "$counter",
                        style: TextStyles.titleLargeStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
