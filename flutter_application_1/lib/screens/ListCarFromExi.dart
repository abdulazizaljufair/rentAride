import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';

import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_nav_controller.dart';

class listCarFromEx extends StatefulWidget {
  @override
  State<listCarFromEx> createState() => _listCarFromEx();

  String carType = '-';
  String cModel = '-';
  String year = '-';
  String lNumber = '-';
  String odometer = '-';
  int cNumber = 0;
  String cAddress = '-';
  int price = 0;

  listCarFromEx(String carType, String cAddress, int cNumber, String lNumber,
      String cModel, String year, String odometer) {
    this.carType = carType;
    this.cModel = cModel;
    this.year = year;
    this.lNumber = lNumber;
    this.cNumber = cNumber;
    this.odometer = odometer;
    this.cAddress = cAddress;
  }
}

class _listCarFromEx extends State<listCarFromEx> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController fromdatecontroller = TextEditingController();

  TextEditingController todatecontroller = TextEditingController();

  TextEditingController fromtimecontroller = TextEditingController();

  TextEditingController totimecontroller = TextEditingController();

  @override
  String sDate;
  String eDate;
  String sTime;
  String eTime;
  int price;
  String uDisplayName;
  var _url;

  CollectionReference car1 =
      FirebaseFirestore.instance.collection('Listed Cars');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> listCar(
      carType,
      cModel,
      year,
      lNumber,
      cNumber,
      odometer,
      cAddress,
      String userId,
      sDate,
      eDate,
      sTime,
      eTime,
      int price,
      uDisplayName) {
    // Call the user's CollectionReference to add a new user
    return car1.add({
      'Car Type': carType,
      'Model': cModel,
      'year': year,
      'Plate Number': lNumber,
      'odometer': odometer,
      'Chasis Number': cNumber,
      'Car address': cAddress,
      'Start Date': sDate,
      'End Date': eDate,
      'Start Time': sTime,
      'End Time': eTime,
      'Price': price.toString(),
      'url': _url,
      'userId': userId,
      'Display Name': uDisplayName,
    }).then((value) => print("Car Added"));
  }

  String startDate;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF27292E),
          title: Text(
            'List Car',
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
                          startDate = fromdatecontroller.text;
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
                              .isAfter(DateTime.tryParse(value))) {
                            return 'Please enter a valid Date';
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
                  height: 15.w,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextformField(
                        hintText: 'Price Per Hour',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a price';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          price = int.tryParse(value);
                        },
                        suffixIcon: Icon(
                          Icons.money,
                          color: Color(0xFF27292E),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  text: 'List',
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  height: 50.h,
                  onTap: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      final String userId =
                          FirebaseAuth.instance.currentUser.uid;

                      uDisplayName =
                          FirebaseAuth.instance.currentUser.displayName;

                      listCar(
                          widget.carType,
                          widget.cModel,
                          widget.year,
                          widget.lNumber,
                          widget.cNumber,
                          widget.odometer,
                          widget.cAddress,
                          userId,
                          sDate,
                          eDate,
                          sTime,
                          eTime,
                          price,
                          uDisplayName);

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
