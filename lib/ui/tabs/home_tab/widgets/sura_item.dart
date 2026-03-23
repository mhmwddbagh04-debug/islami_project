import 'package:flutter/material.dart';
import 'package:islami/ui/tabs/home_tab/models/sura.dart';
import 'package:islami/ui/tabs/home_tab/sura_details.dart';

import '../../../../themes/text_styles.dart';

class SuraItem extends StatelessWidget {
  SuraItem({required this.sura,required this.onItemTap, super.key});

  Sura sura;
  Function(Sura) onItemTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemTap(sura);
     Navigator.pushNamed(context, SuraDetails.routeName,arguments: sura);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/Vector.png', height: 54),
              Text(sura.id.toString(), style: TextStyles.labelMediumStyle()),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.nameEn, style: TextStyles.labelLargeStyle()),
                SizedBox(height: 8),
                Text(sura.versesNumber, style: TextStyles.labelLargeStyle()),
              ],
            ),
          ),
          Text(sura.nameAr, style: TextStyles.labelLargeStyle()),
        ],
      ),
    );
  }
}
