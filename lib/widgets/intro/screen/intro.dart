import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp/shared/store/main.dart';
import 'package:travelapp/utils/utils.dart';
import 'package:travelapp/widgets/home/home.dart';

import '../../../shared/styles/common_style.dart';
import '../../navigation/tab_navigator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  bool isStart = false;
  MainStore mainStore = Get.find();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != 2) {
        setState(() {
          isStart = false;
        });
      } else {
        setState(() {
          isStart = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F6),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFFF0F2F6),
              width: screenSize.width,
              height: screenSize.height,
              child: PageView(
                controller: _pageController,
                children: const [
                  ItemIntro(
                      alignmentImage: Alignment.centerRight,
                      imageUrl: 'assets/images/img_intro1.png',
                      title: 'Book a flight',
                      description:
                          'Found a flight that matches your destination and schedule? Book it instantly.'),
                  ItemIntro(
                      alignmentImage: Alignment.center,
                      imageUrl: 'assets/images/img_intro2.png',
                      title: 'Find a hotel room',
                      description:
                          'Found a flight that matches your destination and schedule? Book it instantly.'),
                  ItemIntro(
                      alignmentImage: Alignment.centerLeft,
                      imageUrl: 'assets/images/img_intro3.jpeg',
                      title: 'Enjoy your trip',
                      description:
                          'Found a flight that matches your destination and schedule? Book it instantly.')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: (screenSize.width - 75) * 375 / 300 + 200),
              width: screenSize.width,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                            dotWidth: 5,
                            dotHeight: 5,
                            activeDotColor: Colors.amber),
                      ),
                      InkWell(
                        onTap: () {
                          if (isStart) {
                            Get.to(() => const TabNavigator());
                            mainStore.setIsFirstLaunch(false);
                          } else {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Container(
                          width: 125,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: Gradients.defaultGradientBackground),
                          child: Text(
                            isStart ? 'Get Started' : 'Next',
                            style: SafeGoogleFont('Rubik',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ItemIntro extends StatelessWidget {
  const ItemIntro({
    super.key,
    required this.alignmentImage,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
  final Alignment alignmentImage;
  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: alignmentImage,
          width: screenSize.width,
          child: Image.asset(
            imageUrl,
            width: screenSize.width - 75,
            height: (screenSize.width - 75) * 375 / 300,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          width: screenSize.width,
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: SafeGoogleFont(
                  'Rubik',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: screenSize.width - 83,
                child: Text(
                  description,
                  style: SafeGoogleFont(
                    'Rubik',
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
