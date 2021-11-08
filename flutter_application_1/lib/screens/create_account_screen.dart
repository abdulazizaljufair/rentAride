import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Database/Database.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'button_nav_controller.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var _userEmail = '';
  var _userPassword = '';
  String phone = "0";
  String fName = 'f';
  String lName = 'l';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      print(_userEmail);
      print(_userPassword);
    }
  }

  // Future<String> getCurrentUserId() async {
  //   return (await FirebaseAuth.instance.currentUser).uid;
  // }

  Future updateUserList(String uid) async {
    return await users.doc(uid).update({
      'fristName': fName, // John Doe
      'lastName': lName, // Stokes and Sons
      'email': _userEmail,
      'phoneNumber': phone,
    });
  }

  Future<void> addUser(String id) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'fristName': fName, // John Doe
          'lastName': lName, // Stokes and Sons
          'email': _userEmail,
          'phoneNumber': phone,
          'userId': id,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Image.asset(
                    'images/login.jpg',
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Rent A Ride',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF27292E),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                MyTextformField(
                  hintText: 'Firstname',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Your Firstname';
                    }
                    return null;
                  },
                  // keyboardType: TextInputType.name,
                  onSaved: (value) {
                    fName = value;
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                MyTextformField(
                  hintText: 'Lastname',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Your Lastname';
                    }
                    return null;
                  },
                  // keyboardType: TextInputType.text,
                  onSaved: (value) {
                    lName = value;
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                MyTextformField(
                  hintText: 'Email',
                  onSaved: (value) {
                    _userEmail = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter Your Email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 35.h,
                ),
                MyTextformField(
                  hintText: 'Password',
                  obscure: true,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (value) {
                    _userPassword = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Your Password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                MyTextformField(
                  hintText: 'Phone Number',
                  // keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    phone = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Your Phone Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomButton(
                  text: 'Create Account',
                  textcolor: Colors.white,
                  buttoncolor: Colors.black,
                  height: 50.h,
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _userEmail, password: _userPassword);

                        addUser(FirebaseAuth.instance.currentUser.uid);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ButtonNavController()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      // _trySubmit();

                    }
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'If you already have account? Login',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
