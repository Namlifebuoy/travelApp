import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/shared/store/home.dart';
import 'package:travelapp/shared/styles/textstyle_ext.dart';
import 'package:travelapp/shared/widgets/app_bar_container.dart';

import '../../../shared/styles/common_style.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  HomeStore homeStore = Get.find();
  late int countGuest;
  late int countRoom;
  @override
  void initState() {
    countGuest = homeStore.countGuest.value;
    countRoom = homeStore.countRoom.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AppBarContainer(
      title: 'Add guest and room',
      description: '',
      extend: SizedBox(
        width: screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: screenSize.width - 50,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset(
                      'assets/images/ic_guest.png',
                      width: 32,
                      height: 32,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Guest',
                      style: TextStyles.normalStyle,
                    ),
                  ]),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (countGuest > 1) {
                              countGuest--;
                            }
                          });
                        },
                        child: Opacity(
                          opacity: countGuest > 1 ? 1.0 : 0.3,
                          child: Image.asset(
                            'assets/images/ic_sub.png',
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 61,
                          child: Text('$countGuest',
                              style: TextStyles.normalStyle)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            countGuest++;
                          });
                        },
                        child: Image.asset(
                          'assets/images/ic_add.png',
                          width: 32,
                          height: 32,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: screenSize.width - 50,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset(
                      'assets/images/ic_room.png',
                      width: 32,
                      height: 32,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Room',
                      style: TextStyles.normalStyle,
                    ),
                  ]),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (countRoom > 1) {
                              countRoom--;
                            }
                          });
                        },
                        child: Opacity(
                          opacity: countRoom > 1 ? 1.0 : 0.3,
                          child: Image.asset(
                            'assets/images/ic_sub.png',
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 61,
                          child: Text('$countRoom',
                              style: TextStyles.normalStyle)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            countRoom++;
                          });
                        },
                        child: Image.asset(
                          'assets/images/ic_add.png',
                          width: 32,
                          height: 32,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                homeStore.setGuest(countGuest);
                homeStore.setRoom(countRoom);
                Get.back();
              },
              child: Container(
                width: screenSize.width - 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: Gradients.defaultGradientBackground,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Done',
                  style: TextStyles.normalStyle.whiteTextColor.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
