import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
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
  var cNumber = 's';
  var cAddress;

  Future<void> addCar() {
    // Call the user's CollectionReference to add a new user
    return car.add({
      'Car Type': carType,
      'Model': model,
      'year': year,
      'License Number': lNumber,
      'odometer': odometer,
      'Chasis Number': cNumber,
      'Car address': cAddress,
    }).then((value) => print("Car Added"));
  }

  Future getUserCarList() async {
    List cList = [];
    try {
      await car.get().then((QuerySnapshot) {
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
                    hintText: 'License Number',
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
                      cNumber = value;
                    },
                    // keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  MyTextformField(
                    hintText: 'Car Address',
                    onSaved: (value) {
                      cAddress = value;
                    },
                    // keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 35,
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
                              builder: (context) => HomeScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
