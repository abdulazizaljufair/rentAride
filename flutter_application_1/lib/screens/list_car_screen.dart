import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/images/Car_images.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import "package:permission_handler/permission_handler.dart";
// import 'package:f'

int cNumber = -1;

class ListCar extends StatefulWidget {
  @override
  State<ListCar> createState() => _ListCarState();
}

class _ListCarState extends State<ListCar> {
  var _url;
  @override
  File _carImageFile;

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

  String sDate;

  String eDate;

  var sTime;

  var eTime;

  int price;

  int postalCode;
  String statrDate;
  String endDate;

  final String userId = FirebaseAuth.instance.currentUser.uid;
  final String uDisplayName = FirebaseAuth.instance.currentUser.displayName;
  List<File> image;
  @override
  CollectionReference car1 =
      FirebaseFirestore.instance.collection('Listed Cars');

  Future<void> listCar() {
    // Call the user's CollectionReference to add a new user

    return car1.add({
      'Car Type': cType,
      'Model': cModel,
      'year': year,
      'Plate Number': lNumber,
      'odometer': odometer,
      'Chasis Number': cNumber,
      'Car address': cAddress,
      'Start Date': sDate,
      'End Date': eDate,
      'Start Time': sTime,
      'End Time': eTime,
      'Price': price,
      'url': _url,
      'userId': userId,
      'Postal Code': postalCode,
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
                    onTap: () async {
                      // image = await pickImage();
                      // ImagesCars(_pickedImage);
                      pickImage();
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF27292E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _carImageFile == null
                          ? Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                            )
                          : Image.file(
                              _carImageFile,
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
                    } else if (int.tryParse(value) <= 1980) {
                      return 'Please enter year above 1980';
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
                  hintText: 'Plate Number',
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
                        onTap: () async {
                          await selectDate(
                              context, CupertinoDatePickerMode.date,
                              controller: fromdatecontroller);

                          statrDate = fromdatecontroller.text;
                          print("$statrDate");
                        },
                        onSaved: (value) {
                          sDate = value;
                        },
                      ),
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
                            } else if (DateTime.parse(statrDate)
                                .isAfter(DateTime.parse(value))) {
                              return 'Please enter a valid Date';
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
                            print('${sDate}, hi');
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
                                controller: fromtimecontroller);
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
                    hintText: 'Price Per Hour',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the price';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      price = int.tryParse(value);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  text: 'List',
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  height: 50,
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("hi you found the bug${cNumber}");
                      if (cNumber != -1) {
                        listCar();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ButtonNavController()));
                      }
                      // if (image == null) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('You Should choose Image')));
                      // }
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

  // Future pickImage() async {
  //   final img = await FilePicker.platform.pickFiles(allowMultiple: true);
  //   if (img == null) return;
  //   final path = img.files;
  //   // setState(() => file = File(path));
  // }

  // void _imagesPicker() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.getImage(source: ImageSource.gallery);
  //   final pickedImageFile = File(pickedImage.path);

  //   setState(() {
  //     _carImageFile = pickedImageFile;

  //     return;
  //   });

  // }
  // void _imagesPicker(File carImageFile) async {
  //   final imagePicker = ImagePicker();
  //   final pickedImageFile =
  //       await imagePicker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedImageFile != null) {
  //       _carImageFile = File(pickedImageFile.path);
  //     }
  //   });
  // }
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _carImageFile = File(pickedFile.path);
    });
    String _id = DateTime.now().millisecondsSinceEpoch.toString();
    Reference firebaseStorageRefImage =
        FirebaseStorage.instance.ref().child("Cars Pictures").child("$_id.png");
    final TaskSnapshot taskImage =
        await firebaseStorageRefImage.putFile(_carImageFile);
    _url = await taskImage.ref.getDownloadURL();
    print(_url);
  }
}
