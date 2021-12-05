import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/images/UserChange.dart';
import 'package:flutter_application_1/model/city_model.dart';
import 'package:flutter_application_1/model/slider_model.dart';
import 'package:flutter_application_1/modules/users.dart';
import 'package:flutter_application_1/screens/ExistingAdress.dart';
import 'package:flutter_application_1/screens/View_booking.dart';
import 'package:flutter_application_1/screens/aboutus.dart';
import 'package:flutter_application_1/screens/add_address.dart';
import 'package:flutter_application_1/screens/add_car_screen.dart';
import 'package:flutter_application_1/screens/add_card_screen.dart';
import 'package:flutter_application_1/screens/addcar2.dart';
import 'package:flutter_application_1/screens/choose_Existingcard.dart';
import 'package:flutter_application_1/screens/finalpayment1.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/manage_profilescreen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_list_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userId = FirebaseAuth.instance.currentUser.uid;
  dynamic user;
  File _userImageFile;

  void _pickedImage(File Image) {
    if (_userImageFile == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please Upload Image'),
        backgroundColor: Theme.of(context).errorColor,
      ));
    }
    _userImageFile = Image;
  }

  final List<SliderModel> imagList = [
    SliderModel(
      title: 'Rent a car for only 200 riyals a day ',
      imageUrl:
          'https://images.unsplash.com/photo-1514316454349-750a7fd3da3a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    ),
    SliderModel(
      title: 'Rent a car for only 200 riyals a day ',
      imageUrl:
          'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    ),
    SliderModel(
      title: 'Rent a car for only 200 riyals a day ',
      imageUrl:
          'https://images.unsplash.com/photo-1570356528233-b442cf2de345?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fGNhcnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    ),
    SliderModel(
      title: 'Rent a car for only 200 riyals a day ',
      imageUrl:
          'https://images.unsplash.com/photo-1606611013016-969c19ba27bb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9yZCUyMGNhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    ),
  ];
  List<CityModel> cities = [
   CityModel(
     name: 'Riyadh',
     imageURL: 'images/riyadh.jpeg'
   ),
    CityModel(
        name: 'Jeddah',
        imageURL: 'images/jeddah.jpeg'
    ),
    CityModel(
        name: 'Dammam',
        imageURL: 'images/Dammam.jpeg'
    ),
    CityModel(
        name: 'Makkah',
        imageURL: 'images/makkah.jpeg'
    ),

  ];

  // void x() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('userId', isEqualTo: userId)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       user.email = doc["email"] ?? " ";
  //       var name = doc["fristName"] ?? " ";
  //       user.lName = doc['lastName'] ?? " ";
  //       user.phone = doc['phoneNumber'] ?? " ";
  //       user.uId = doc["userId"] ?? " ";
  //     });
  //   });
  // }
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    // x();
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          return Scaffold(
            drawer: Drawer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.h,
                ),
                imageUser(_pickedImage),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  data['fristName'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  data['email'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Divider(
                  thickness: 3,
                  height: 35,
                ),
                InkWell(
                  child: Mylist(
                    icon: Icons.credit_card,
                    title: 'Manage Cards',
                    onTap: () {
                      showMyDialog(
                        context: context,
                        primarytitle: 'please choose card from',
                        button1title: 'Choose Existing card',
                        button2title: 'Add new card',
                        onPressedButton1: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChooseCard()));
                        },
                        onPressedButton2: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddCard()));
                        },
                      );
                    },
                  ),
                ),
                InkWell(
                  child: Mylist(
                    icon: Icons.car_repair,
                    title: 'Manage cars',
                    onTap: () {
                      showMyDialog(
                        context: context,
                        primarytitle: 'please choose car from',
                        button1title: 'Existing car',
                        button2title: 'Add new car',
                        onPressedButton1: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddCarScreen()));
                        },
                        onPressedButton2: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddCar()));
                        },
                      );
                    },
                  ),
                ),
                InkWell(
                  child: Mylist(
                    icon: Icons.location_on,
                    title: 'Manage Address',
                    onTap: () {
                      showMyDialog(
                        context: context,
                        primarytitle: 'choose Address from',
                        button1title: 'Existing Address',
                        button2title: 'Add new Address',
                        onPressedButton1: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exaddress()));
                        },
                        onPressedButton2: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ManageAdress()));
                        },
                      );
                    },
                  ),
                ),
                Mylist(
                  icon: Icons.person,
                  title: 'Manage Profile',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ManageProfile()));
                  },
                ),
                Mylist(
                  icon: Icons.info,
                  title: 'About Us',
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                ),
                SizedBox(
                  height: 100.h,
                ),
                InkWell(
                  child: Mylist(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  ),
                ),
              ],
            )),
            appBar: AppBar(
              backgroundColor: Color(0xFF27292E),
              title: Text('Home'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: getimageswidgets(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Recent search',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/car.jpeg')),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'KIA',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    '20/3/2021',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'from:10:30 PM',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Insurance type: standard',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Booking Status: Pending',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                  ),
                                ],
                              )
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 3,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Where you can find us',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      itemCount: cities.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(15),
                          height: 200.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(blurRadius: 10, color: Colors.black38)
                              ]),
                          child: Column(
                            children: [

                              Container(
                                height: 130.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(cities[index].imageURL)),
                                ),
                              ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              Text(
                                cities[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 350.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'images/facebook.jpeg',
                            height: 40.h,
                            width: 40.w,
                          ),
                          Text('@RentARide')
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/twitter logo.png',
                            height: 40.h,
                            width: 40.w,
                          ),
                          Text('@RentARide')
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/instagram logo.jpeg',
                            height: 40.h,
                            width: 40.w,
                          ),
                          Text('@RentARide')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          );
        }

        return Text("loading");
      },
    );
  }

  List<Widget> getimageswidgets() {
    return imagList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.imageUrl,
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              item.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }
}
