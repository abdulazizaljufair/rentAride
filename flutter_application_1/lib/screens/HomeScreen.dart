import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/model/slider_model.dart';
import 'package:flutter_application_1/screens/ExistingAdress.dart';
import 'package:flutter_application_1/screens/View_booking.dart';
import 'package:flutter_application_1/screens/add_address.dart';
import 'package:flutter_application_1/screens/add_car_screen.dart';
import 'package:flutter_application_1/screens/add_card_screen.dart';
import 'package:flutter_application_1/screens/addcar2.dart';
import 'package:flutter_application_1/screens/choose_Existingcard.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/manage_profilescreen.dart';
import 'package:flutter_application_1/widgets/my_list_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          CircleAvatar(
            maxRadius: 50,
            backgroundImage: AssetImage('images/avatar1.jpg'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'abdulaziz aljufair',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('abdulazizaljufair@gmail.com'),
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChooseCard()));
                  },
                  onPressedButton2: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddCard()));
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddCar()));
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Exaddress()));
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ManageProfile()));
            },
          ),
          Mylist(
            icon: Icons.view_agenda,
            title: 'View Booking',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ViewBooking()));
            },
          ),
          SizedBox(
            height: 150,
          ),
          InkWell(
            child: Mylist(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
              height: 15,
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
                'Where you can find us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(15),
                    height: 150,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(blurRadius: 10, color: Colors.black38)
                        ]),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/city1.png',
                          height: 120,
                          width: 120,
                        ),
                        Text(
                          'Riyadh',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 10, color: Colors.black38)
                  ]),
              child: Column(
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      """ Rent A Ride is a mobile application which acts as an intermediary, allowing customers to rent a car or act as lessors to list their car for rent. Our application will provide a variety of car options and prices that suits everyone's needs. This will allow people in Saudi Arabia with unused cars to list them. This will create a great opportunity for an individual to benefit from the app and to boost the economy.

 """),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'images/facebook.jpeg',
                      height: 40,
                      width: 40,
                    ),
                    Text('@RentARide')
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/twitter logo.png',
                      height: 40,
                      width: 40,
                    ),
                    Text('@RentARide')
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/instagram logo.jpeg',
                      height: 40,
                      width: 40,
                    ),
                    Text('@RentARide')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
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
                                fontSize: 20.0,
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
