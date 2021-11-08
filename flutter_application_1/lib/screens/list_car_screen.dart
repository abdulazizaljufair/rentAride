import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/List_cartwo.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCar extends StatefulWidget {
  @override
  _ListCarState createState() => _ListCarState();
}

bool checkBoxValue = false;

class _ListCarState extends State<ListCar> {
  @override
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
          child: Column(
            children: [
              Center(
                child: InkWell(
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
              ),
              SizedBox(
                height: 10.h,
              ),
              Text('Upload car photo'),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 15.h,
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
              ),
              SizedBox(
                height: 15.h,
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
              ),
              SizedBox(
                height: 15.h,
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
              ),
              SizedBox(
                height: 15.h,
              ),
              MyTextformField(
                hintText: 'Chasis Number',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              MyTextformField(
                hintText: 'Car adress',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                text: 'Next',
                buttoncolor: Color(0xFF27292E),
                textcolor: Colors.white,
                height: 50.h,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListCarTWO()));
                },
              ),
            ],
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
