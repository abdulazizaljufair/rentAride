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
  String sDate;
  String eDate;

  reserveCar(
      String carType,
      String cModel,
      String year,
      String lNumber,
      int cNumber,
      String odometer,
      String cAddress,
      int price,
      String insurancetype,
      String sDate,
      String eDate) {
    this.carType = carType;
    this.cModel = cModel;
    this.year = year;
    this.lNumber = lNumber;
    this.cNumber = cNumber;
    this.odometer = odometer;
    this.cAddress = cAddress;
    this.price = price;
    this.insurancetype = insurancetype;
    this.sDate = sDate;
    this.eDate = eDate;
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

  String startDate;
  String endDate;
  String startTime;
  String endTime;
  int totalPricePerHour = 0;

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
      startDate,
      endDate,
      startTime,
      endTime,
      insurancetype,
      totalPricePerHour) {
    // Call the user's CollectionReference to add a new user
    return bookings.doc(userId.toString() + cNumber.toString()).set({
      'Car Type': cType,
      'Model': cModel,
      'year': year,
      'Plate Number': lNumber,
      'odometer': odometer,
      'Chasis Number': cNumber,
      'Car address': cAddress,
      'Start Date': startDate,
      'End Date': endDate,
      'Start Time': startTime,
      'End Time': endTime,
      'Price': price,
      'Insurance type': insurancetype,
      'userId': userId,
      'status': 'Pending',
      'bookingId': userId.toString() + cNumber.toString(),
      'totalPrice': totalPricePerHour
    }).then((value) => print("Car Added"));
  }

  Widget build(BuildContext context) {
    print(widget.sDate);
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
                          startDate = value;
                        },
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Color(0xFF27292E),
                        ),
                        onTap: () {
                          selectDateWithLimit(
                              context, CupertinoDatePickerMode.date,
                              controller: fromdatecontroller,
                              minDate: widget.sDate,
                              maxDate: widget.eDate);
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
                            } else if (DateTime.tryParse(startDate)
                                .isAfter(DateTime.tryParse(endDate))) {
                              return 'Please enter a valid Date';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            endDate = value;
                          },
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Color(0xFF27292E),
                          ),
                          onTap: () {
                            selectDateWithLimit(
                                context, CupertinoDatePickerMode.date,
                                controller: todatecontroller,
                                minDate: widget.sDate,
                                maxDate: widget.eDate);
                          }),
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
                          startTime = value;
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
                          endTime = value;
                          if (value != '') {
                            totalPricePerHour = ((int.tryParse(
                                            startTime.substring(0, 2)) -
                                        int.tryParse(endTime.substring(0, 2)))
                                    .abs() *
                                widget.price);
                          }
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
                    _formKey.currentState.save();

                    if (_formKey.currentState.validate()) {
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
                          startDate,
                          startDate,
                          startTime,
                          endTime,
                          widget.insurancetype,
                          totalPricePerHour);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ButtonNavController()));
                    }
                  },
                ),
              ],
            ),
          ),
        ));
    // print(totalPricePerHour);
  }
}
