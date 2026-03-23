import 'package:flutter/cupertino.dart';

import '../../themes/colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.imagePath, required this.child});
final String imagePath;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
        imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.black.withAlpha(90), AppColors.black],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
