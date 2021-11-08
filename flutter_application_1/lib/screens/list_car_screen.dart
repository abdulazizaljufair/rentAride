import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/List_cartwo.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/helper/functions.dart';

class ListCar extends StatefulWidget {
  @override
  _ListCarState createState() => _ListCarState();
}

bool checkBoxValue = false;

class _ListCarState extends State<ListCar> {
  var _formKey = GlobalKey<FormState>();
  var cType;
  var cModel;
  var year;
  var odometer;
  var cNumber;
  var cAddress;
  var lNumber;
  @override
  CollectionReference car1 = FirebaseFirestore.instance.collection('Cars');

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
    }).then((value) => print("Car Added"));
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
                      pickImage();
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cNumber = value;
                  },
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
                CustomButton(
                  text: 'Next',
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  height: 50,
                  onTap: () async {
                    _formKey.currentState.save();
                    listCar();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListCarTWO()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<XFile>> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    final List<XFile> image = await _picker.pickMultiImage();
    return image;
  }
}
