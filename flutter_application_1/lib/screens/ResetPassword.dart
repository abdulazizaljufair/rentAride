import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

import 'Edit_profile.dart';
import 'manage_profilescreen.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var _formKey = GlobalKey<FormState>();

  String _email;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextformField(
                hintText: 'Email',
                // controller: _passwordCon,
                // keyboardType: TextInputType.number,
                // obscure: true,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter Your Password';
                //   } else if (value.length < 8) {
                //     return 'Password must be at least 8 characters';
                //   }
                //   return null;
                // },
                onSaved: (value) {
                  _email = value;
                  print(_email);
                },
              ),
              SizedBox(
                height: 20,
              ),
              // MyTextformField(
              //   hintText: 'New Password',
              //   controller: _newPasswordCon,
              //   keyboardType: TextInputType.number,
              //   obscure: true,
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Please enter Your Password';
              //     } else if (value.length < 8) {
              //       return 'Password must be at least 8 characters';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(
              //   height: 20,
              // // ),
              // MyTextformField(
              //   hintText: 'Confirm Password',
              //   controller: _repeatPaswwordCon,
              //   keyboardType: TextInputType.number,
              //   obscure: true,
              //   validator: (value) {
              //     return _newPasswordCon.text == value
              //         ? null
              //         : 'please enter the same password';
              //   },
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              CustomButton(
                onTap: () {
                  _formKey.currentState.save();
                  auth.sendPasswordResetEmail(email: _email);
                  // if (_formKey.currentState.validate()) {
                  //   Navigator.pop(context);
                  // }
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ManageProfile()));
                },
                height: 65,
                buttoncolor: Color(0XFF27292E),
                textcolor: Colors.white,
                text: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
