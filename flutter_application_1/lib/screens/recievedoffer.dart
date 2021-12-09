import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/users.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recievedoffer extends StatefulWidget {
  @override
  State<Recievedoffer> createState() => _RecievedofferState();
}

class _RecievedofferState extends State<Recievedoffer> {
  CollectionReference bookings =
      FirebaseFirestore.instance.collection('Bookings');

  List vBookings = [];

  void initState() {
    super.initState();
    FetchDatabaseList();
  }

  FetchDatabaseList() async {
    try {
      await bookings.get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          setState(() {
            vBookings.add(element.data());
          });
        });
      });
      return vBookings;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text('Recieved Offers'),
      ),
      body: ListView.separated(
        itemCount: vBookings.length,
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
                        vBookings[index]['Car Type'],
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'from ' +
                            vBookings[index]['sDate'] +
                            ' to ' +
                            vBookings[index]['eDate'],
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'from ' +
                            vBookings[index]['sTime'] +
                            ' to ' +
                            vBookings[index]['eTime'],
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Insurance type:' + vBookings[index]['insurancetype'],
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
