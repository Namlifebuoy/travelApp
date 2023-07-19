import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/utils/utils.dart';
import 'package:travelapp/widgets/home/screens/hotel_screen.dart';

import '../../shared/styles/common_style.dart';
import 'component/item_select.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Color(0xFFF0F2F6),
      child: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: 186,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(35)),
                gradient: Gradients.defaultGradientBackground),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset('assets/images/img_oval_home.png',
                        width: 148, height: 109)),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset('assets/images/img_oval_home2.png',
                        width: 132, height: 100))
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60, left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 71,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Nam!',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 30,
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Where are you going next?',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 12,
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 71,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/ic_notification.png',
                                width: 20,
                                height: 24,
                                color: Colors.white,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  'assets/images/img_duck.jpeg',
                                  width: 45,
                                  height: 45,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/ic_search.png',
                            width: 16,
                            height: 16,
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search your destination')),
                        )
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemSelect(
                          bgColor: Color(0xFFFE9C5E).withOpacity(0.2),
                          iconUrl: 'assets/images/ic_building.png',
                          title: 'Hotels',
                          onPress: () {
                            Get.to(() => HotelScreen());
                          },
                        ),
                        ItemSelect(
                          bgColor: Color(0xFFF77777).withOpacity(0.2),
                          iconUrl: 'assets/images/ic_flight.png',
                          title: 'Flights',
                          onPress: () {
                            Get.to(() => HotelScreen());
                          },
                        ),
                        ItemSelect(
                          bgColor: Color(0xFF3EC8BC).withOpacity(0.2),
                          iconUrl: 'assets/images/ic_all.png',
                          title: 'All',
                          onPress: () {
                            Get.to(() => HotelScreen());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
