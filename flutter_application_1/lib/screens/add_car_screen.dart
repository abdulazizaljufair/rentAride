import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'HomeScreen.dart';

class AddCar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  CollectionReference car = FirebaseFirestore.instance.collection('Cars');
  var carType = 'o';
  var model = 'i';
  var lNumber = 'z';
  var odometer = 's';
  var year = 's';
  int cNumber = 0;
  var cAddress;
  final String userId = FirebaseAuth.instance.currentUser.uid;
  int postalCode;

  Future<void> addCar() {
    // Call the user's CollectionReference to add a new user
    return car.doc(userId.toString() + cNumber.toString()).set({
      'Car Type': carType,
      'Model': model,
      'year': year,
      'Plate Number': lNumber,
      'odometer': odometer,
      'Chasis Number': cNumber,
      'Car address': cAddress,
      'Postal Code': postalCode,
      'userId': userId,
      'carId': (userId + cNumber.toString()),
    }).then((value) => print("Car Added"));
  }

  Future getUserCarList() async {
    List cList = [];
    try {
      await car.where("userId", isEqualTo: userId).get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          cList.add(element.data());
        });
      });
      return cList;
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
          title: Text(
            'Add Car',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: Container(
                                height: 85.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFF27292E),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.camera_alt_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text('Upload Car photo')
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextformField(
                    hintText: 'Car Type',
                    onSaved: (value) {
                      carType = value;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextformField(
                      hintText: 'Model',
                      onSaved: (value) {
                        model = value;
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextformField(
                    hintText: 'Plate Number',
                    onSaved: (value) {
                      lNumber = value;
                    },
                    // keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextformField(
                    hintText: 'Odometer',
                    onSaved: (value) {
                      odometer = value;
                    },
                    // keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextformField(
                    hintText: 'Year',
                    onSaved: (value) {
                      year = value;
                    },
                    // keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextformField(
                    hintText: 'Chasis Number',
                    onSaved: (value) {
                      cNumber = int.tryParse(value);
                    },
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextformField(
                          hintText: 'Car address',
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            cAddress = value;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: MyTextformField(
                        hintText: 'Postal Code',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          postalCode = int.tryParse(value);
                        },
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttoncolor: Color(0xFF27292E),
                    textcolor: Colors.white,
                    text: 'Save',
                    height: 50.h,
                    onTap: () async {
                      _formKey.currentState.save();
                      addCar();

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ButtonNavController()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
