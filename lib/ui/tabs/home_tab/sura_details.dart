import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/themes/colors.dart';
import 'package:islami/ui/tabs/home_tab/models/sura.dart';

import '../../../themes/text_styles.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'suraDetails';
  final Sura sura;

  const SuraDetails({required this.sura, super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String? suraContent;

  @override
  void initState() {
    super.initState();
    getSuraDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.sura.nameEn),
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
                        widget.sura.nameAr,
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
                  child: suraContent == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.gold,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Text(
                            suraContent!,
                            style: TextStyles.titleLargeStyle(
                              color: AppColors.gold,
                            ),
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

  void getSuraDetails() async {
    try {
      String suraDetailsText = await rootBundle.loadString(
        'assets/Suras/${widget.sura.id}.txt',
      );
      var ayaList = suraDetailsText
          .trim()
          .split('\n')
          .map((aya) => aya.trim())
          .toList()
          .join(' || ');

      setState(() {
        suraContent = ayaList;
      });
    } catch (e) {
      // Handle error (e.g., file not found)
      setState(() {
        suraContent = "Error loading sura content";
      });
    }
  }
}
