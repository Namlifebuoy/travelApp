import 'package:flutter/material.dart';

import '../../../shared/styles/common_style.dart';
import '../../../shared/styles/textstyle_ext.dart';

class ItemHotel extends StatelessWidget {
  const ItemHotel({
    super.key,
    required this.text1,
    required this.text2,
    required this.iconUrl,
    required this.onPress,
  });

  final String text1;
  final String text2;
  final String iconUrl;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        margin: EdgeInsets.only(top: 25),
        width: screenSize.width,
        height: 70,
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Image.asset(
                iconUrl,
                width: 32,
                height: 32,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyles.smallStyle.text2Color,
                  ),
                  Text(
                    text2,
                    style: TextStyles.defaultStyle.medium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
