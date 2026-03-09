import 'package:flutter/material.dart';
import 'package:islami/ui/home_view.dart';
import 'package:islami/ui/intro_screen.dart';
import 'package:islami/ui/tabs/home_tab/models/sura.dart';
import 'package:islami/ui/tabs/home_tab/sura_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        SuraDetails.routeName:(context){
          var sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetails(sura: sura);
        },
      },
    );
  }
}
