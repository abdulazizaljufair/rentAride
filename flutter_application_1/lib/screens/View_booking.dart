import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/modules/users.dart';
import 'package:flutter_application_1/screens/add_card_screen.dart';
import 'package:flutter_application_1/screens/choose_Existingcard.dart';
import 'package:flutter_application_1/screens/finalpayment1.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewBooking extends StatelessWidget {
  @override
  CollectionReference bookings =
      FirebaseFirestore.instance.collection('bookings');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF27292E),
        title: Text('View Booking'),
      ),
      body: ListView.separated(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(15),
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
                      Text(
                        'Booking Status: Pending',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 180.w,
                        child: CustomButton(
                            textcolor: Colors.white,
                            buttoncolor: Color(0XFF27292E),
                            text: 'Pay Now',
                            height: 40,
                            onTap: () {
                              showMyDialog(
                                context: context,
                                primarytitle: 'please choose card from',
                                button1title: 'Choose Existing card',
                                button2title: 'Add new card',
                                onPressedButton1: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ChooseCard()));
                                },
                                onPressedButton2: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Paymentcar()));
                                },
                              );
                            }),
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
    );
  }
}
