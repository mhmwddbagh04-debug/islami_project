import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/themes/colors.dart';
import 'package:islami/ui/tabs/home_tab/widgets/sura_item.dart';

import '../../../themes/text_styles.dart';
import 'models/sura.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(
          'assets/images/quran_bg.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.black.withAlpha(50), AppColors.black],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
          ),
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(child: Image.asset('assets/images/app_home.png')),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.black.withAlpha(70),
                    hintText: 'Sura Name',
                    hintStyle: TextStyles.labelLargeStyle(),
                    prefixIcon: ImageIcon(
                      AssetImage('assets/images/ic_quran.png'),
                      color: AppColors.gold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: AppColors.gold),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: AppColors.gold),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Suras', style: TextStyles.labelLargeStyle()),
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SuraItem(sura: suraList[index]),
              ),
              separatorBuilder: (_, _) => Divider(
                thickness: 1,
                color: AppColors.offWhite,
                indent: 35,
                endIndent: 35,
              ),
              itemCount: suraList.length,
            ),
          ],
        ),
      ],
    );
  }
}
