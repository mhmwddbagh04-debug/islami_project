import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home_view.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const String routeName = 'intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Image.asset(
                    'assets/images/Mosque.png',
                    width: width * .7,
                  ).fadeInDown(),
                  Image.asset(
                    'assets/images/islami_logo.png',
                    width: width * .4,
                  ).zoomIn(duration: Duration(milliseconds: 1000)),
                  Image.asset(
                    'assets/images/branding.png',
                    width: width * .5,
                  ).fadeInUp(),
                ],
              ),
            ),
          ),
          Positioned(
            right: width * .06,
            child: Image.asset('assets/images/Glow.png').slideDown(),
          ),
          Positioned(
            left: 0,
            top: height * .2,
            child: Image.asset('assets/images/Shape_left.png').slideInLeft(),
          ),
          Positioned(
            right: 0,
            bottom: height * .1,
            child: Image.asset('assets/images/Shape_right.png').slideInRight(),
          ),
        ],
      ),
    );
  }
}
