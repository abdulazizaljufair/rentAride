import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/ChatScreen_2.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';

import 'package:flutter_application_1/screens/chatsScreen.dart';
import 'package:flutter_application_1/screens/choose_existing_car.dart';
import 'package:flutter_application_1/screens/list_car_screen.dart';
import 'package:flutter_application_1/screens/recievedoffer.dart';
import 'package:flutter_application_1/screens/searchscreen.dart';

class ButtonNavController extends StatefulWidget {
  @override
  _ButtonNavControllerState createState() => _ButtonNavControllerState();
}

class _ButtonNavControllerState extends State<ButtonNavController> {
  @override
  int selectedindex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ChatScreen2(),
    Recievedoffer(),
    ListCar1(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMyDialog(
            context: context,
            primarytitle: 'Please choose Type of Listing',
            button1title: 'Choose Existing car',
            button2title: 'List new car',
            onPressedButton1: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChooseExistingCar()));
            },
            onPressedButton2: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ListCar1()));
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.home, Icons.search, Icons.message, Icons.person],
        backgroundColor: Color(0xFF27292E),
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        activeIndex: selectedindex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          selectedindex = index;
          setState(() {});
        },
        //other params
      ),
      body: screens[selectedindex],
    );
  }
}
