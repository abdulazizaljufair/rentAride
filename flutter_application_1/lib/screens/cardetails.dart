import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/resrve.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  String insurancetype = 'Insurance Type';

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
                  height: 15.h,
                ),
                Text(
                  'Ford',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Aziz saleh',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
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
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(""" 

 """),
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => reserveCar()));
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
