import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_car_screen.dart';
import 'package:flutter_application_1/screens/create_account_screen.dart';
import 'add_card_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCard extends StatefulWidget {
  @override
  State<ChooseCard> createState() => _ChooseCardState();
}

class _ChooseCardState extends State<ChooseCard> {
  List cardL2 = [];

  void initState() {
    super.initState();
    FetchDatabaseList();
  }

  FetchDatabaseList() async {
    CollectionReference users = FirebaseFirestore.instance.collection('Cards');
    final String userId = FirebaseAuth.instance.currentUser.uid;

    try {
      await users
          .where('userId', isEqualTo: userId)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          setState(() {
            cardL2.add(element.data());
          });
        });
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(cardL2);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          ' Choose Existing Card',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: cardL2.isEmpty
          ? Center(
              child: Text("No saved cards"),
              widthFactor: 5,
              heightFactor: 5,
            )
          : ListView.builder(
              itemCount: cardL2.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/card.jpeg',
                          width: 100.w,
                          height: 90.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            Text(cardL2[index]['Holder Name'].toString()),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(cardL2[index]['Expire Date'].toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
