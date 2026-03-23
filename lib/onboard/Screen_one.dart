import 'package:flutter/cupertino.dart';
import 'package:islami/themes/colors.dart';

import '../themes/text_styles.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset('assets/images/page1.png', color: AppColors.gold,),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('Welcome To Islmi App',style: TextStyles.titleLargeStyle(color: AppColors.gold,),

      ),
    )
    ]

    );
  }
}
