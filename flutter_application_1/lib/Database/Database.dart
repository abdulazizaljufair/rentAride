import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/create_account_screen.dart';

class Database {
  final userData = CreateAccountScreen();

  final String uid;
  Database({this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String fName, String lName, String pNumber) async {
    return await users.doc().set({
      'First Name': fName,
      'Last Name': lName,
      'Phone Number': pNumber,
    });
  }

  Stream<QuerySnapshot> get user {
    return userData.users.snapshots();
  }
}
