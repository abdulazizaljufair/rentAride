import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/manage_profilescreen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_account_screen.dart';

class EditProfile extends StatelessWidget {
  final auth = FirebaseAuth.instance.currentUser;
  final update = CreateAccountScreen();
  var _formKey = GlobalKey<FormState>();
  String fName;
  String lName;
  String email;
  String dlisence;
  String pNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Edit profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    height: 110.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF27292E),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 65,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text('Upload Profile picture'),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyTextformField(
                      hintText: 'First Name',
                      onSaved: (value) {
                        fName = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: MyTextformField(
                          hintText: 'Last Name',
                          onSaved: (value) {
                            lName = value;
                          })),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              MyTextformField(
                  hintText: 'Email',
                  onSaved: (value) {
                    email = value;
                  }),
              SizedBox(
                height: 25.h,
              ),
              MyTextformField(
                  hintText: 'Driver Lisence',
                  onSaved: (value) {
                    dlisence = value;
                  }),
              SizedBox(
                height: 25.h,
              ),
              MyTextformField(
                  hintText: 'Phone Number',
                  onSaved: (value) {
                    pNumber = value;
                  }),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                onTap: () {
                  _formKey.currentState.save();
                  auth.updateEmail(email);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ManageProfile()));
                },
                height: 65.h,
                buttoncolor: Color(0XFF27292E),
                textcolor: Colors.white,
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
