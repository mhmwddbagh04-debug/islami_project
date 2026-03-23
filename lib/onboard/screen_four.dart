import 'package:flutter/cupertino.dart';
import 'package:islami/themes/colors.dart';

import '../themes/text_styles.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/page4.png', color: AppColors.gold,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Bearish',style: TextStyles.titleLargeStyle(color: AppColors.gold,),),
            ),
            Text('Praise the name of your Lord, the Most High',textAlign: TextAlign.center,style: TextStyles.titleLargeStyle(color: AppColors.gold,),

            )
          ]

      ),
    );
  }
}
