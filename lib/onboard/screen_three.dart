import 'package:flutter/cupertino.dart';
import 'package:islami/themes/colors.dart';

import '../themes/text_styles.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/page3.png', color: AppColors.gold,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Reading the Quran',style: TextStyles.titleLargeStyle(color: AppColors.gold,),),
            ),
            Text('Read, and your Lord is the Most Generous',textAlign: TextAlign.center,style: TextStyles.titleLargeStyle(color: AppColors.gold,),

            )
          ]

      ),
    );
  }
}
