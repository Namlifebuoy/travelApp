import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/shared/store/main.dart';
import 'package:travelapp/widgets/intro/screen/intro.dart';
import 'package:travelapp/widgets/navigation/tab_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MainStore userStore = Get.find();

  @override
  void initState() {
    super.initState();
    gotoIntro();
  }

  void gotoIntro() async {
    await Future.delayed(const Duration(seconds: 2));
    if (userStore.isFirstLaunch.value) {
      Get.to(() => const IntroScreen());
    } else {
      Get.to(() => const TabNavigator());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/img_bg_splash.png',
          width: screenSize.width,
          height: screenSize.height,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/img_oval_splash.png',
          width: screenSize.width,
          height: screenSize.height,
          fit: BoxFit.contain,
        )
      ]),
    );
  }
}
