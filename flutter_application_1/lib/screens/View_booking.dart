import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/modules/users.dart';
import 'package:flutter_application_1/screens/add_card_screen.dart';
import 'package:flutter_application_1/screens/choose_Existingcard.dart';
import 'package:flutter_application_1/screens/finalpayment1.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewBooking extends StatefulWidget {
  @override
  State<ViewBooking> createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  @override
  CollectionReference Bookings =
      FirebaseFirestore.instance.collection('Bookings');

  List pendingBookings = [];
  List completedBookings = [];

  void initState() {
    super.initState();
    FetchDatabaseListPending();
    FetchDatabaseListCompleted();
  }

  final String userId = FirebaseAuth.instance.currentUser.uid;
  FetchDatabaseListPending() async {
    try {
      await Bookings.where('status', isEqualTo: 'Pending')
          .where('userId', isEqualTo: userId)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          setState(() {
            pendingBookings.add(element.data());
          });
        });
      });
      return pendingBookings;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  FetchDatabaseListCompleted() async {
    try {
      await Bookings.where('status', isEqualTo: 'Completed')
          .where('userId', isEqualTo: userId)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          setState(() {
            completedBookings.add(element.data());
          });
        });
      });
      return completedBookings;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF27292E),
        title: Text('View Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: pendingBookings.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/car.jpeg')),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car Type ' + pendingBookings[index]['Car Type'],
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Date ' +
                                  pendingBookings[index]['Start Date'] +
                                  ' to ' +
                                  pendingBookings[index]['End Date'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Time ' +
                                  pendingBookings[index]['Start Time'] +
                                  ' to ' +
                                  pendingBookings[index]['End Time'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Insurance type: ' +
                                  pendingBookings[index]['Insurance type'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Booking Status: ' +
                                  pendingBookings[index]['status'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: CustomButton(
                                      textcolor: Colors.white,
                                      buttoncolor: Color(0XFF27292E),
                                      text: 'Pay Now',
                                      height: 40.h,
                                      onTap: () {
                                        showMyDialog(
                                          context: context,
                                          primarytitle:
                                              'please choose card from',
                                          button1title: 'Choose Existing card',
                                          button2title: 'Add new card',
                                          onPressedButton1: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChooseCard()));
                                          },
                                          onPressedButton2: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Paymentcar(
                                                          pendingBookings[index]
                                                              ['bookingId'],
                                                        )));
                                          },
                                        );
                                      }),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: CustomButton(
                                    textcolor: Colors.white,
                                    buttoncolor: Colors.grey,
                                    text: 'Cancel',
                                    height: 40.h,
                                    onTap: () {
                                      showMyDialog(
                                          context: context,
                                          button1title: 'Yes',
                                          button2title: 'NO',
                                          onPressedButton1: () {
                                            Navigator.pop(context);
                                          },
                                          onPressedButton2: () {
                                            Navigator.pop(context);
                                          },
                                          primarytitle:
                                              'Are you sure you want cancel your booking? ');
                                    },
                                  ),
                                ),
                              ],
                            )
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
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Past Booking',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.separated(
              itemCount: completedBookings.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/car.jpeg')),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car Type ' +
                                  completedBookings[index]['Car Type'],
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Date ' +
                                  completedBookings[index]['Start Date'] +
                                  ' to ' +
                                  completedBookings[index]['End Date'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Time ' +
                                  completedBookings[index]['Start Time'] +
                                  ' to ' +
                                  completedBookings[index]['End Time'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Insurance type: ' +
                                  completedBookings[index]['Insurance type'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Booking Status: ' +
                                  completedBookings[index]['status'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20.h,
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
          ],
        ),
      ),
    );
  }
}
