import 'package:flutter/material.dart';
import 'package:islami/themes/colors.dart';
import 'package:islami/ui/tabs/home_tab/sura_details.dart';
import 'package:islami/ui/tabs/home_tab/widgets/sura_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constans/shared_perferences.dart';
import '../../../themes/text_styles.dart';
import '../../widgets/background_widget.dart';
import 'models/sura.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Sura> currentSura = [];
  List<Sura> mostRecent = [];

  @override
  void initState() {
    super.initState();
    _getMostRecent();
    for (var sura in suraList) {
      currentSura.add(sura);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        BackgroundWidget(
          imagePath: 'assets/images/quran_bg.png',
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SafeArea(
                  child: Image.asset(
                    'assets/images/app_home.png',
                    width: width * .6,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    onChanged: (value) {
                      _search(value);
                    },
                    style: TextStyles.labelLargeStyle(),
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
              if (currentSura.length == 114) ...[
                if (mostRecent.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Most Recent',
                        style: TextStyles.labelLargeStyle(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 170,
                      child: ListView.separated(
                        padding: EdgeInsets.all(16),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            addToMostRecent(mostRecent[index]);
                            Navigator.pushNamed(
                              context,
                              SuraDetails.routeName,
                              arguments: mostRecent[index],
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.gold,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: .start,
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      mostRecent[index].nameEn,
                                      style: TextStyles.titleLargeStyle(
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      mostRecent[index].nameAr,
                                      style: TextStyles.titleLargeStyle(
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      mostRecent[index].versesNumber,
                                      style: TextStyles.titleSmallStyle(
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/img_most_recent.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20),
                        itemCount: mostRecent.length,
                      ),
                    ),
                  ),
                ],
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Suras', style: TextStyles.labelLargeStyle()),
                  ),
                ),
              ],
              SliverList.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: SuraItem(
                    sura: currentSura[index],
                    onItemTap: addToMostRecent,
                  ),
                ),
                separatorBuilder: (_, _) => Divider(
                  thickness: 1,
                  color: AppColors.offWhite,
                  indent: 35,
                  endIndent: 35,
                ),
                itemCount: currentSura.length,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _search(String input) {
    currentSura = suraList
        .where(
          (sura) =>
              ((sura.nameEn.toLowerCase().contains(input.toLowerCase()) ||
              (sura.nameAr).contains(input))),
        )
        .toList();
    setState(() {});
  }

  Future<void> _getMostRecent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var idsList =
        sharedPreferences.getStringList(SharedPerferences.mostRecent.value) ??
        [];
    mostRecent = [];
    for (int i = 0; i < idsList.length; i++) {
      int id = int.parse(idsList[i]);
      mostRecent.add(suraList[id - 1]);
    }
    print(mostRecent);

    setState(() {});
  }

  Future<void> addToMostRecent(Sura sura) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    mostRecent.removeWhere((element) => element.id == sura.id);
    var newList = [sura, ...mostRecent];
    List<String> idsList = [];
    for (var value in newList) {
      idsList.add(value.id.toString());
    }
    await sharedPreferences.setStringList(
      SharedPerferences.mostRecent.value,
      idsList,
    );
    _getMostRecent();
  }
}
