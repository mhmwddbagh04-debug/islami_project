import 'package:flutter/cupertino.dart';
import 'package:islami/themes/colors.dart';

import '../themes/text_styles.dart';

class ScreenTow extends StatelessWidget {
  const ScreenTow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/page2.png', color: AppColors.gold,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Welcome To Islmi App',style: TextStyles.titleLargeStyle(color: AppColors.gold,),),
            ),
            Text('We Are Very Excited To Have You In Our Community',textAlign: TextAlign.center,style: TextStyles.titleLargeStyle(color: AppColors.gold,),

            )
          ]

      ),
    );
  }
}
