import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/Bookings.dart';
import 'package:flutter_application_1/screens/cardetails.dart';
import 'package:flutter_application_1/widgets/Search.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_application_1/widgets/time_date.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'list_car_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  CollectionReference lCars =
      FirebaseFirestore.instance.collection('Listed Cars');

  CollectionReference recent =
      FirebaseFirestore.instance.collection('Recent Search');

  CollectionReference bookings =
      FirebaseFirestore.instance.collection('Bookings');

  List lcar = [];

  List booking = [];

  Future<void> RecentSearch(cType, int price, userId, cModel, year, odometer) {
    return recent.add({
      'Car Type': cType,
      'Price': price,
      'userId': userId,
      'Model': cModel,
      'Year': year,
      'odometer': odometer,
      'createdAt': Timestamp.now()
    }).then((value) => print('recent search added'));
  }

  void initState() {
    super.initState();
    FetchDatabaseList();
  }

  FetchDatabaseList() async {
    try {
      await lCars
          .where('userId', isNotEqualTo: FirebaseAuth.instance.currentUser.uid)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          setState(() {
            lcar.add(element.data());
          });
        });
      });
      return lcar;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  check(String bookingId) async {
    try {
      await bookings
          .where('bookingId', isEqualTo: bookingId)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          booking.add(element.data());
        });
      });

      return booking.length > 0;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Browse',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextformField(
                  hintText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade50,
                    size: 15,
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: customSearch());
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('From'),
                SizedBox(
                  height: 10.h,
                ),
                TimeDate(),
                Divider(
                  color: Colors.grey,
                ),
                Text('Until'),
                TimeDate(),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: lcar.length,
              padding: EdgeInsets.symmetric(horizontal: 15),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(
                          lcar[index]['Car Type'],
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Model ' + lcar[index]['Model'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    final userId = FirebaseAuth.instance.currentUser.uid;
                    String carType = lcar[index]['Car Type'];
                    String cModel = lcar[index]['Model'];
                    String year = lcar[index]['year'];
                    String lNumber = lcar[index]['License Number'];
                    String odometer = lcar[index]['odometer'];
                    int cNumber = lcar[index]['Chasis Number'];
                    String cAddress = lcar[index]['Car address'];
                    int price = lcar[index]['Price'];
                    String sDate = lcar[index]['Start Date'];
                    String eDate = lcar[index]['End Date'];
                    // String DisplayName = lcar[index]['Price'];
                    // String url = lcar[index]['url'];
                    if (await check(userId.toString() + cNumber.toString()) !=
                        true) {
                      RecentSearch(
                          carType, price, userId, cModel, year, odometer);

                      print(carType);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CarDetails(
                              carType,
                              cModel,
                              year,
                              lNumber,
                              cNumber,
                              odometer,
                              cAddress,
                              price,
                              sDate,
                              eDate)));
                    } else {
                      booking.length--;
                      print('car already ');
                      print(userId + cNumber.toString());
                      print(booking.length);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
