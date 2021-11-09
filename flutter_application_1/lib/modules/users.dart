import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  dynamic email;
  dynamic fName;
  dynamic lName;
  dynamic uId;
  dynamic phone;

  UserInfo({this.email, this.fName, this.lName, this.phone, this.uId});

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

class FireStore {
  Future<UserInfo> getUserInfo(String id) async {
    UserInfo user;
    await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        user.email = doc["email"] ?? " ";
        user.fName = doc["fristName"] ?? "xx ";
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
}
