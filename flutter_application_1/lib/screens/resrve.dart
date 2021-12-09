import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';

import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_nav_controller.dart';

class reserveCar extends StatefulWidget {
  @override
  State<reserveCar> createState() => _reserveCarState();

  String carType = '-';
  String cModel = '-';
  String year = '-';
  String lNumber = '-';
  String odometer = '-';
  int cNumber = 0;
  String cAddress = '-';
  int price = 0;
  String insurancetype = '-';

  reserveCar(
      String carType,
      String cModel,
      String year,
      String lNumber,
      int cNumber,
      String odometer,
      String cAddress,
      int price,
      String insurancetype) {
    this.carType = carType;
    this.cModel = cModel;
    this.year = year;
    this.lNumber = lNumber;
    this.cNumber = cNumber;
    this.odometer = odometer;
    this.cAddress = cAddress;
    this.price = price;
    this.insurancetype = insurancetype;
  }
}

class _reserveCarState extends State<reserveCar> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController fromdatecontroller = TextEditingController();

  TextEditingController todatecontroller = TextEditingController();

  TextEditingController fromtimecontroller = TextEditingController();

  TextEditingController totimecontroller = TextEditingController();

  @override
  CollectionReference booking =
      FirebaseFirestore.instance.collection('Bookings');

  CollectionReference recent =
      FirebaseFirestore.instance.collection('Recent Search');

  final auth = FirebaseAuth.instance.currentUser;

  String sDate;
  String eDate;
  String sTime;
  String eTime;

  CollectionReference bookings =
      FirebaseFirestore.instance.collection('Bookings');

  Future<void> Bookings(
      String cType,
      cModel,
      year,
      lNumber,
      odometer,
      int cNumber,
      cAddress,
      int price,
      userId,
      sDate,
      sTime,
      eTime,
      insurancetype) {
    // Call the user's CollectionReference to add a new user
    return bookings.doc(userId.toString() + cNumber.toString()).set({
      'Car Type': cType,
      'Model': cModel,
      'year': year,
      'License Number': lNumber,
      'odometer': odometer,
      'Chasis Number': cNumber,
      'Car address': cAddress,
      'Start Date': sDate,
      'End Date': eDate,
      'Start Time': sTime,
      'End Time': eTime,
      'Price': price,
      'Insurance type': insurancetype,
      'userId': userId,
      'status': 'Pending',
      'bookingId': userId.toString() + cNumber.toString(),
    }).then((value) => print("Car Added"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF27292E),
          title: Text(
            'Reserve Car',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextformField(
                        hintText: 'From Date',
                        controller: fromdatecontroller,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the date';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          sDate = value;
                        },
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Color(0xFF27292E),
                        ),
                        onTap: () {
                          selectDate(context, CupertinoDatePickerMode.date,
                              controller: fromdatecontroller);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: MyTextformField(
                        hintText: 'Until Date',
                        keyboardType: TextInputType.datetime,
                        controller: todatecontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the date';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          eDate = value;
                        },
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Color(0xFF27292E),
                        ),
                        onTap: () {
                          selectDate(context, CupertinoDatePickerMode.date,
                              controller: todatecontroller);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextformField(
                        hintText: 'From time ',
                        controller: fromtimecontroller,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the time';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          sTime = value;
                        },
                        suffixIcon: Icon(
                          Icons.access_time,
                          color: Color(0xFF27292E),
                        ),
                        onTap: () {
                          selectDate(context, CupertinoDatePickerMode.time,
                              controller: fromtimecontroller);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: MyTextformField(
                        hintText: 'until',
                        controller: totimecontroller,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the time';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          eTime = value;
                        },
                        suffixIcon: Icon(
                          Icons.access_time,
                          color: Color(0xFF27292E),
                        ),
                        onTap: () {
                          selectDate(context, CupertinoDatePickerMode.time,
                              controller: totimecontroller);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  text: 'Reserve',
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  height: 50.h,
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      final String user = FirebaseAuth.instance.currentUser.uid;

                      Bookings(
                          widget.carType,
                          widget.cModel,
                          widget.year,
                          widget.lNumber,
                          widget.odometer,
                          widget.cNumber,
                          widget.cAddress,
                          widget.price,
                          user,
                          sDate,
                          sTime,
                          eTime,
                          widget.insurancetype);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ButtonNavController()));
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
