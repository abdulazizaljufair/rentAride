import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Database/UpdateImage.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/manage_profilescreen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_account_screen.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final auth = FirebaseAuth.instance.currentUser;
  String uid = '';

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
            children: <Widget>[
              imagesP(),
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
                onTap: () async {
                  _formKey.currentState.save();
                  await auth.updateEmail(email);

                  await CreateAccountScreen()
                      .updateUserList(auth.uid, fName, lName, email, pNumber);

                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => ManageProfile()));
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
