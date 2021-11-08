import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String email;
  String fName;
  String lName;
  String uId;
  String phone;

  User({this.email, this.fName, this.lName, this.phone, this.uId});

  Future<User> getUserInfo(String id) async {
    User user;
    await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        user.email = doc['email'] ?? " ";
        user.fName = doc["fristName"] ?? " ";
        user.lName = doc['lastName'] ?? " ";
        user.phone = doc['phoneNumber'] ?? " ";
        user.uId = doc["userId"] ?? " ";
      });
    });
    return user;
    // w((doc) {
    //     print(doc["first_name"]);
    // });
  }

  // Future getUserCardList() async {
  //   List cList = [];
  //   try {
  //     await card.get().then((QuerySnapshot) {
  //       QuerySnapshot.docs.forEach((element) {
  //         cList.add(element.data());
  //       });
  //     });
  //     return cList;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
