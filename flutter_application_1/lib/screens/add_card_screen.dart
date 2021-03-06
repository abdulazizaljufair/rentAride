import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'HomeScreen.dart';
import 'create_account_screen.dart';

class AddCard extends StatelessWidget {
  bool checkBoxValue = false;

  final _formKey = GlobalKey<FormState>();
  // final uid = CreateAccountScreen().getCurrentUserId();

  CollectionReference card = FirebaseFirestore.instance.collection('Cards');
  String hName = 'o';
  String cNumber = 'i';
  String eDate = 'z';
  String sCode = 's';
  final String userId = FirebaseAuth.instance.currentUser.uid;

  Future<void> addCard() {
    // Call the user's CollectionReference to add a new user
    return card.add({
      'Holder Name': hName,
      'Card Number': cNumber,
      'Expire Date': eDate,
      'Security Number': sCode,
      'userId': userId,
    }).then((value) => print("Card Added"));
  }

  Future getUserCardList() async {
    List cList = [];
    try {
      await card.where("userId", isEqualTo: userId).get().then((QuerySnapshot) {
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
            'Add Card',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextformField(
                  hintText: 'Holder Name',
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    hName = value;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                MyTextformField(
                    hintText: 'Card Number',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      cNumber = value;
                    }),
                SizedBox(
                  height: 30.h,
                ),
                MyTextformField(
                    hintText: 'Expire date',
                    keyboardType: TextInputType.datetime,
                    onSaved: (value) {
                      eDate = value;
                    }),
                SizedBox(
                  height: 30.h,
                ),
                MyTextformField(
                    hintText: 'Security Code',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      sCode = value;
                    }),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  buttoncolor: Color(0xFF27292E),
                  textcolor: Colors.white,
                  text: 'Save',
                  height: 50.h,
                  onTap: () async {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) addCard();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ButtonNavController()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
