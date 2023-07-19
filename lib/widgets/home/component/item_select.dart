import 'package:flutter/material.dart';

import '../../../shared/styles/textstyle_ext.dart';

class ItemSelect extends StatelessWidget {
  const ItemSelect({
    super.key,
    required this.bgColor,
    required this.iconUrl,
    required this.title,
    required this.onPress,
  });

  final Color bgColor;
  final String iconUrl;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: () {
            onPress();
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            width: (screenSize.width - 14.67 * 2 - 50) / 3,
            height: 75,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              iconUrl,
              width: 24,
              height: 24,
            ),
          ),
        ),
        Text(title, style: TextStyles.defaultStyle)
      ],
    );
  }
}
