import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xFF6357cc);
  static const Color secondColor = Color(0xFF8f67e8);
  static const Color orangeColor = Color(0xFFFE9C5E);

  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color textColor = Color(0xFF313131);
  static const Color text1Color = Color(0xFF323B4B);
  static const Color text2Color = Color(0xFF636363);
  static const Color subTitleColor = Color(0xFF838383);
  static const Color backgroundScaffoldColor = Color(0xFFF0F2F6);
  static const Color white = Color(0xFFFFFFFF);
}

class Gradients {
  static const LinearGradient defaultGradientBackground = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.secondColor,
        AppColor.primaryColor,
      ]);
}
