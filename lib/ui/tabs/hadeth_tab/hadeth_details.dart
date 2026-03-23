import 'package:flutter/material.dart';
import 'package:islami/themes/colors.dart';
import 'package:islami/ui/tabs/hadeth_tab/models/hadeth.dart';

import '../../../themes/text_styles.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'HadethDetails';
  final Hadeth hadeth;

  const HadethDetails({required this.hadeth, super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String? suraContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.hadeth.name),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/img_left_corner.png'),
                    Expanded(
                      child: Text(
                        widget.hadeth.name,
                        style: TextStyles.titleLargeStyle(
                          color: AppColors.gold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset('assets/images/img_right_corner.png'),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.hadeth.content,
                      style: TextStyles.titleLargeStyle(color: AppColors.gold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/img_bottom_decoration.png',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
