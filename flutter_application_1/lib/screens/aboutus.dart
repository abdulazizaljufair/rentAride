import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text('About Us'),
      ),
      body: Column(
        children: [
          Container(
            height: 250.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black38)]),
            child: Column(
              children: [
                Text(
                  'About Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                    """ Rent A Ride is a mobile application which acts as an intermediary, allowing customers to rent a car or act as lessors to list their car for rent. Our application will provide a variety of car options and prices that suits everyone's needs. This will allow people in Saudi Arabia with unused cars to list them. This will create a great opportunity for an individual to benefit from the app and to boost the economy.

 """),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
