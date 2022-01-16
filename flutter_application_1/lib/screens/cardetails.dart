import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/resrve.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
  String carType;
  String cModel;
  String year;
  String lNumber;
  String odometer;
  int cNumber;
  String cAddress;
  int price;
  String sDate;
  String eDate;
  int postalCode;

  CarDetails(
      String carType,
      String cModel,
      String year,
      String lNumber,
      int cNumber,
      String odometer,
      String cAddress,
      int price,
      String sDate,
      String eDate,
      int postalCode) {
    this.carType = carType;
    this.cModel = cModel;
    this.year = year;
    this.lNumber = lNumber;
    this.cNumber = cNumber;
    this.odometer = odometer;
    this.cAddress = cAddress;
    this.price = price;
    this.sDate = sDate;
    this.eDate = eDate;
    this.postalCode = postalCode;
  }
}

class _CarDetailsState extends State<CarDetails> {
  String insurancetype = 'Insurance Type';
  String DisplayName = FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/car.jpeg',
            width: MediaQuery.of(context).size.width,
            height: 300.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '               ' +
                      widget.carType.toUpperCase() +
                      " " +
                      widget.cModel.toUpperCase() +
                      ' ' +
                      widget.year,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '  Car Owner Aziz',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 250.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFF27292E))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Car Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.sp,
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text('Odometer: ' + widget.odometer),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text('Price per hour: ' + widget.price.toString()),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text('Pick up and Return Location: ' + widget.cAddress),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text('Postal Code: ' + widget.postalCode.toString()),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text('Dates Avaliablity  From:   ' + widget.sDate),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text('Dates Avaliablity  Until:    ' + widget.eDate)
                    ],
                  ),
                ),
                DropdownButton(
                  hint: Text(insurancetype),
                  isExpanded: true,
                  onChanged: (value) {
                    insurancetype = value;

                    setState(() {});
                  },
                  iconSize: 30,
                  items: [
                    'Standard',
                    'premium',
                  ].map(
                    (value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  text: 'Next',
                  height: 55.h,
                  onTap: () {
                    if (insurancetype == 'Insurance Type') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please choose Insurance Type')));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => reserveCar(
                                  widget.carType,
                                  widget.cModel,
                                  widget.year,
                                  widget.lNumber,
                                  widget.cNumber,
                                  widget.odometer,
                                  widget.cAddress,
                                  widget.price,
                                  insurancetype,
                                  widget.sDate,
                                  widget.eDate)));
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
