import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/images/Car_images.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import "package:permission_handler/permission_handler.dart";

int cNumber = -1;

class ListCar extends StatefulWidget {
  @override
  State<ListCar> createState() => _ListCarState();
}

class _ListCarState extends State<ListCar> {
  @override
  File _carImageFile;

  void _pickedImage(File Image) {
    // if (_carImageFile == null) {
    //   Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text('Please Upload Image'),
    //     backgroundColor: Theme.of(context).errorColor,
    //   ));
    // }
    _carImageFile = Image;
  }

  Future<bool> CheckChasisNumber(int chasisNumber) async {
    List cList = [];
    try {
      await car1
          .where("Chasis Number", isEqualTo: chasisNumber)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          cList.add(element.data());
        });
      });

      return cList.length > 0;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  bool checkBoxValue = false;

  TextEditingController fromdatecontroller = TextEditingController();

  TextEditingController todatecontroller = TextEditingController();

  TextEditingController fromtimecontroller = TextEditingController();

  TextEditingController totimecontroller = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  var cType;

  var cModel;

  var year;

  var odometer;

  var cAddress;

  var lNumber;

  var sDate;

  var eDate;

  var sTime;

  var eTime;

  int price;

  PermissionStatus _status;

  File file;

  final String userId = FirebaseAuth.instance.currentUser.uid;

  @override
  CollectionReference car1 =
      FirebaseFirestore.instance.collection('Listed Cars');

  Future<void> listCar() {
    // Call the user's CollectionReference to add a new user
    return car1.add({
      'Car Type': cType,
      'Model': cModel,
      'year': year,
      'License Number': lNumber,
      'odometer': odometer,
      'Chasis Number': cNumber,
      'Car address': cAddress,
      'Start Date': sDate,
      'End Date': eDate,
      'Start Time': sTime,
      'End Time': eTime,
      'Price': price,
      'userId': userId,
    }).then((value) => print("Car Added"));
  }

  Future getUserCarList() async {
    List cList = [];
    try {
      await car1.get().then((QuerySnapshot) {
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      ImagesCars(_pickedImage);
                    },
                    child: Container(
                      height: 85,
                      width: 80,
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
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Upload car photo'),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextformField(
                  hintText: 'Car Type',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cType = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextformField(
                  hintText: 'Car Model',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cModel = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextformField(
                  hintText: 'Year',
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    year = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextformField(
                  hintText: 'odometer',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    odometer = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextformField(
                  hintText: 'Chasis Number',
                  onChanged: (value) async {
                    print(value);
                    print("hi alwaleed");
                    if (!await CheckChasisNumber(int.tryParse(value))) {
                      cNumber = int.tryParse(value);
                      print("You can add it");
                    } else {
                      print('Chasis already exist');
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }

                    return null;
                  },
                  onSaved: (value) async {},
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextformField(
                  hintText: 'License Number',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    lNumber = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextformField(
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
                SizedBox(
                  height: 15,
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
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Color(0xFF27292E),
                          ),
                          onTap: () {
                            selectDate(context, CupertinoDatePickerMode.date,
                                controller: fromdatecontroller);
                          },
                          onSaved: (value) {
                            sDate = value;
                          }),
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
                            }
                            return null;
                          },
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Color(0xFF27292E),
                          ),
                          onTap: () {
                            selectDate(context, CupertinoDatePickerMode.date,
                                controller: todatecontroller);
                          },
                          onSaved: (value) {
                            eDate = value;
                          }),
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
                          suffixIcon: Icon(
                            Icons.access_time,
                            color: Color(0xFF27292E),
                          ),
                          onTap: () {
                            selectDate(context, CupertinoDatePickerMode.time,
                                controller: totimecontroller);
                          },
                          onSaved: (value) {
                            sTime = value;
                          }),
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
                          suffixIcon: Icon(
                            Icons.access_time,
                            color: Color(0xFF27292E),
                          ),
                          onTap: () {
                            selectDate(context, CupertinoDatePickerMode.time,
                                controller: totimecontroller);
                          },
                          onSaved: (value) {
                            eTime = value;
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                MyTextformField(
                    hintText: 'Price',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the price';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      price = value;
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  text: 'Next',
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  height: 50,
                  onTap: () async {
                    if (!_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("hi you found the bug${cNumber}");
                      if (cNumber != -1) {
                        listCar();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final img = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (img == null) return;
    final path = img.files;
    // setState(() => file = File(path));
  }
}
