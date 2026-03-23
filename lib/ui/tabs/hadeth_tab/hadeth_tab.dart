import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/tabs/hadeth_tab/hadeth_details.dart';

import '../../../themes/colors.dart';
import '../../../themes/text_styles.dart';
import '../../widgets/background_widget.dart';
import 'models/hadeth.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = List.filled(19, Hadeth('', '', 0));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAhadeth();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(
            imagePath: 'assets/images/hadith_bg.png',
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_home.png',
                        width: width * .6,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: CarouselSlider.builder(
                      itemCount: ahadeth.length,
                      itemBuilder: (context, index, realIndex) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HadethDetails.routeName,
                            arguments: ahadeth[index],
                          );

                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(26),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/HadithCardBackGround 1.png',

                              ),
                              opacity: .6
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                        "assets/images/img_left_corner.png",
                                      ),
                                      color: AppColors.black,
                                      size: 70,
                                    ),
                                    Expanded(
                                      child: Text(
                                        ahadeth[index].name,
                                        style: TextStyles.labelLargeStyle(
                                          color: AppColors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ImageIcon(
                                      AssetImage(
                                        'assets/images/img_right_corner.png',
                                      ),
                                      color: AppColors.black,
                                      size: 70,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ahadeth[index].content,
                                    style: TextStyles.bodyLargeStyle(
                                      color: AppColors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Image.asset('assets/images/Mosque-02 2.png',width: double.infinity,fit: BoxFit.fitWidth,)

                            ],
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        height: double.infinity,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.27,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadAhadeth() async {
    String fileContent = await PlatformAssetBundle().loadString(
      'assets/Suras/hadeeth.txt',
    );

    List<String> ahadethContent = fileContent.trim().split('#');

    for (int i = 0; i < ahadethContent.length; i++) {
      var hadethLines = ahadethContent[i].trim().split('\n');
      var title = hadethLines.first;
      var content = hadethLines.sublist(1).join(' ');
      var hadeth = Hadeth(title, content, i);
      ahadeth[i] = hadeth;
    }
    setState(() {});
  }
}
