import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/shared/styles/common_style.dart';
import 'package:travelapp/shared/styles/textstyle_ext.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
    required this.extend,
    required this.title,
    required this.description,
  });

  final Widget extend;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: AppColor.backgroundScaffoldColor,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(35)),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset('assets/images/img_oval_home.png',
                          width: 148, height: 109)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset('assets/images/img_oval_home2.png',
                          width: 132, height: 100)),
                  Positioned(
                      top: 60,
                      left: 25,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: AppColor.white,
                          ),
                          child: Image.asset(
                            'assets/images/ic_left_arrow.png',
                            width: 16,
                            height: 16,
                          ),
                        ),
                      )),
                  description != ''
                      ? Positioned(
                          bottom: 12,
                          child: Column(
                            children: [
                              Container(
                                width: screenSize.width,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  title,
                                  style: TextStyles.headingStyle,
                                ),
                              ),
                              Text(
                                description,
                                style: TextStyles.smallStyle.whiteTextColor,
                              ),
                            ],
                          ),
                        )
                      : Positioned(
                          top: 58,
                          child: Container(
                            width: screenSize.width,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 227,
                                  child: Text(
                                    title,
                                    style: TextStyles.headingStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 186),
            child: extend,
          )
        ],
      ),
    );
  }
}
