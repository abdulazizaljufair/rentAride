import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/screens/sucessbook.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Paymentcar extends StatelessWidget {
  String bookingId;

  String sTime;
  String eTime;
  String sDate;
  String eDate;
  String insuranceType;
  String carType;

  int price;
  final _formKey = GlobalKey<FormState>();

  Paymentcar(String bookingId, int price, sTime, eTime, sDate, eDate,
      insuranceType, carType) {
    this.bookingId = bookingId;
    this.price = price;
    this.sTime = sTime;
    this.eDate = eDate;
    this.sDate = sDate;
    this.eTime = eTime;
    this.insuranceType = insuranceType;
    this.carType = carType;
  }
  final userId = FirebaseAuth.instance.currentUser.uid;
  BookingsStatus() async {
    // Call the user's CollectionReference to add a new user

    await FirebaseFirestore.instance.collection('Bookings').doc(bookingId).set({
      'status': 'Completed',
      'Start Time': sTime,
      'End Time': eTime,
      'Start Date': sDate,
      'End Date': eDate,
      'Insurance type': insuranceType,
      'BookingId': bookingId,
      'Car Type': carType,
      'userId': userId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextformField(
                hintText: 'Holder Name',
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Holder Name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              MyTextformField(
                hintText: 'Card Number',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Your Card Number';
                  } else if (value.length < 16) {
                    return 'Card Number must be at 16 digits';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              MyTextformField(
                hintText: 'Expire date',
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the expire date';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              MyTextformField(
                hintText: 'Security Code',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Your Security code';
                  } else if (value.length < 3) {
                    return 'Security code must be at least 3 digits';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Total Price: ' + price.toString(),
                textScaleFactor: 1.2,
              ),
              Icon(Icons.price_change),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                buttoncolor: Color(0xFF27292E),
                textcolor: Colors.white,
                text: 'Pay',
                height: 50.h,
                onTap: () async {
                  await BookingsStatus();
                  if (_formKey.currentState.validate()) {
                    await BookingsStatus();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "Payment Complete",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset(
                                  'images/payment.jpg',
                                  height: 120.h,
                                  width: 120.w,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: CustomButton(
                                    buttoncolor: Color(0xFF27292E),
                                    textcolor: Colors.white,
                                    text: 'Ok',
                                    height: 50.h,
                                    onTap: () {
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ButtonNavController()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Navigator.pushReplacement(context,
//MaterialPageRoute(builder: (context) => ConfirmBooking()));
