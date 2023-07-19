import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/shared/store/home.dart';

import 'shared/store/main.dart';
import 'widgets/intro/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MainStore());
  Get.put(HomeStore());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travel app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
