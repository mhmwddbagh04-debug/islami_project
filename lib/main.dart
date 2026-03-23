import 'package:flutter/material.dart';
import 'package:islami/onboard/onboard_screen.dart';
import 'package:islami/ui/home_view.dart';
import 'package:islami/ui/intro_screen.dart';
import 'package:islami/ui/tabs/hadeth_tab/hadeth_details.dart';
import 'package:islami/ui/tabs/hadeth_tab/models/hadeth.dart';
import 'package:islami/ui/tabs/home_tab/models/sura.dart';
import 'package:islami/ui/tabs/home_tab/sura_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingDone = prefs.getBool('onboarding_done') ?? false;
  runApp(MyApp(onboardingDone: onboardingDone));
}

class MyApp extends StatelessWidget {
  final bool onboardingDone;

  const MyApp({super.key, required this.onboardingDone});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: onboardingDone
          ? HomeScreen.routeName
          : IntroScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        OnboardScreen.routeName: (_) => OnboardScreen(),
        SuraDetails.routeName: (context) {
          var sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetails(sura: sura);
        },
        HadethDetails.routeName: (context) {
          var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
          return HadethDetails(hadeth: hadeth);
        },
      },
    );
  }
}
