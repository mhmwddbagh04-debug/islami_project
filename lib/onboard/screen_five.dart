import 'package:flutter/cupertino.dart';
import 'package:islami/themes/colors.dart';

import '../themes/text_styles.dart';

class ScreenFive extends StatelessWidget {
  const ScreenFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/page5.png', color: AppColors.gold,),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text('Holy Quran Radio',style: TextStyles.titleLargeStyle(color: AppColors.gold,),),
            ),
            Text('You can listen to the Holy Quran Radio through the application for free and easily',textAlign: TextAlign.center,style: TextStyles.titleLargeStyle(color: AppColors.gold,),

            )
          ]

      ),
    );
  }
}
