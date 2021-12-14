import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/ListCarFromExi.dart';
import 'package:flutter_application_1/screens/add_car_screen.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCarScreen extends StatefulWidget {
  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  @override
  List car = [];
  List listedc = [];

  void initState() {
    super.initState();
    FetchDatabaseList();
    FetchDatabaseListPending();
  }

  CollectionReference listedCars =
      FirebaseFirestore.instance.collection('Listed Cars');

  CollectionReference cars = FirebaseFirestore.instance.collection('Cars');

  final userId = FirebaseAuth.instance.currentUser.uid;
  FetchDatabaseList() async {
    dynamic res = await AddCar().getUserCarList();

    if (res == null) {
      print('Unable to retrive');
    } else {
      setState(() {
        car = res;
      });
    }
  }

  FetchDatabaseListPending() async {
    try {
      await listedCars
          .where('userId', isEqualTo: userId)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          setState(() {
            listedc.add(element.data());
          });
        });
      });
      return listedc;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF27292E),
        title: Text('Existing Cars'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Saved Cars',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.separated(
              itemCount: car.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/car.jpeg')),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car Type: ' + car[index]['Car Type'],
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Car Model: ' + car[index]['Model'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CustomButton(
                                      textcolor: Colors.white,
                                      buttoncolor: Color(0XFF27292E),
                                      text: 'List',
                                      height: 30.h,
                                      onTap: () {
                                        showMyDialog(
                                          context: context,
                                          primarytitle:
                                              'please choose card from',
                                          button1title: 'Choose Existing card',
                                          button2title: 'Add new card',
                                          onPressedButton1: () {},
                                          onPressedButton2: () {
                                            String carType =
                                                car[index]['Car Type'];
                                            String carAdd =
                                                car[index]['Car address'];
                                            int carCN =
                                                car[index]['Chasis Number'];
                                            String carPN =
                                                car[index]['License Number'];
                                            String carModel =
                                                car[index]['Model'];
                                            String carYear = car[index]['year'];
                                            String odometer =
                                                car[index]['odometer'];

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        listCarFromEx(
                                                            carType,
                                                            carAdd,
                                                            carCN,
                                                            carPN,
                                                            carModel,
                                                            carYear,
                                                            odometer)));
                                          },
                                        );
                                      }),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: CustomButton(
                                    textcolor: Colors.white,
                                    buttoncolor: Color(0XFF27292E),
                                    text: 'Delete',
                                    height: 30.h,
                                    onTap: () {
                                      showMyDialog(
                                          context: context,
                                          button1title: 'Yes',
                                          button2title: 'NO',
                                          onPressedButton1: () async {
                                            await cars
                                                .doc(car[index]['carId'])
                                                .delete();
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ButtonNavController()));
                                          },
                                          onPressedButton2: () {
                                            Navigator.pop(context);
                                          },
                                          primarytitle:
                                              'Are you sure you want to delete your car? ');
                                    },
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
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Listed Cars',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.separated(
              itemCount: listedc.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/car.jpeg')),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car Type ' + listedc[index]['Car Type'],
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'From Date: ' +
                                  listedc[index]['Start Date'] +
                                  ' to ' +
                                  listedc[index]['End Date'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'From Time: ' +
                                  listedc[index]['Start Time'] +
                                  ' to ' +
                                  listedc[index]['End Time'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Price Per Hour: ' +
                                  listedc[index]['Price'].toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.h,
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
          ],
        ),
      ),
    );
  }
}
