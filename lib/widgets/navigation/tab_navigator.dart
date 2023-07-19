import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travelapp/widgets/booking/booking.dart';
import 'package:travelapp/widgets/favorite/favorite.dart';
import 'package:travelapp/widgets/home/home.dart';
import 'package:travelapp/widgets/profile/profile.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentTab,
        onTap: (i) => setState(() {
          currentTab = i;
          if (i == 0) {
            currentScreen = HomeScreen();
          }
          if (i == 1) {
            currentScreen = FavoriteScreen();
          }
          if (i == 2) {
            currentScreen = BookingScreen();
          }
          if (i == 3) {
            currentScreen = ProfileScreen();
          }
        }),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.add_box),
            title: Text("Booking"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
