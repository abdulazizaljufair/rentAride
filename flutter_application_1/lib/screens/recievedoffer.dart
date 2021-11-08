import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recievedoffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text('Recieved Offers'),
      ),
      body: ListView.separated(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/car.jpeg')),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KIA',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        '20/3/2021',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'from:10:30 PM',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Insurance type: standard',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80.w,
                            height: 35.h,
                            child: CustomButton(
                              text: 'Accept',
                              buttoncolor: Colors.green,
                              textcolor: Colors.white,
                              height: 30.h,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          SizedBox(
                            width: 80.w,
                            height: 35.h,
                            child: CustomButton(
                              text: 'Reject',
                              buttoncolor: Colors.red,
                              textcolor: Colors.white,
                              height: 30.h,
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
    );
  }
}
