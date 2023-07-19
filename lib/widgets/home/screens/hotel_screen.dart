import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/widgets/home/screens/room_screen.dart';
import 'package:travelapp/widgets/home/screens/select_date_screen.dart';

import '../../../shared/store/home.dart';
import '../../../shared/styles/common_style.dart';
import '../../../shared/styles/dimension_constants.dart';
import '../../../shared/widgets/app_bar_container.dart';
import '../component/item_hotel.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Get.find();
    return AppBarContainer(
        title: 'Hotel Booking',
        description: 'Choose your favorite hotel and enjoy the service',
        extend: GetBuilder<HomeStore>(
          init: HomeStore(),
          builder: (_) => Container(
            color: AppColor.backgroundScaffoldColor,
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: Column(children: [
              ItemHotel(
                text1: 'Destination',
                text2: 'South Korea',
                iconUrl: 'assets/images/ic_location.png',
                onPress: () {},
              ),
              ItemHotel(
                text1: 'Select Date',
                text2: homeStore.selectDate.value != ''
                    ? homeStore.selectDate.value
                    : '______',
                iconUrl: 'assets/images/ic_calendar.png',
                onPress: () {
                  Get.to(() => SelectDateScreen());
                },
              ),
              ItemHotel(
                text1: 'Guest and Room',
                text2:
                    '${homeStore.countGuest} Guest, ${homeStore.countRoom} Room',
                iconUrl: 'assets/images/ic_sleep.png',
                onPress: () {
                  Get.to(() => RoomScreen());
                },
              ),
            ]),
          ),
        ));
  }
}
