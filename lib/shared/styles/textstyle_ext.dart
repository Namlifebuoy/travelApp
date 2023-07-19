import 'package:flutter/material.dart';
import 'package:travelapp/shared/styles/common_style.dart';
import 'package:travelapp/utils/utils.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get fontHeader {
    return copyWith(
      fontSize: 22,
      height: 22 / 20,
    );
  }

  TextStyle get fontCaption {
    return copyWith(
      fontSize: 12,
      height: 12 / 10,
    );
  }

  TextStyle get semibold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get textColor {
    return copyWith(color: AppColor.textColor);
  }

  TextStyle get text1Color {
    return copyWith(color: AppColor.text1Color);
  }

  TextStyle get text2Color {
    return copyWith(color: AppColor.text2Color);
  }

  TextStyle get primaryTextColor {
    return copyWith(color: AppColor.primaryColor);
  }

  TextStyle get whiteTextColor {
    return copyWith(color: Colors.white);
  }

  TextStyle get subTitleTextColor {
    return copyWith(color: AppColor.subTitleColor);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static TextStyle defaultStyle = SafeGoogleFont(
    'Rubik',
    fontSize: 14,
    color: AppColor.text1Color,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static TextStyle defaultStyle2 = TextStyle(
    fontSize: 14,
    color: AppColor.textColor,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle normalStyle = SafeGoogleFont(
    'Rubik',
    fontSize: 16,
    color: AppColor.textColor,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle largeStyle = SafeGoogleFont(
    'Rubik',
    fontSize: 18,
    color: AppColor.textColor,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle headingStyle = SafeGoogleFont(
    'Rubik',
    fontSize: 30,
    color: AppColor.white,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle smallStyle = SafeGoogleFont(
    'Rubik',
    fontSize: 12,
    color: AppColor.textColor,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle minStyle = SafeGoogleFont(
    'Rubik',
    fontSize: 10,
    color: AppColor.text1Color,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
}

// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);