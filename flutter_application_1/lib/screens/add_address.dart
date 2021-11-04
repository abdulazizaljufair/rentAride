import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class ManageAdress extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  CollectionReference address1 =
      FirebaseFirestore.instance.collection('address');
  String coName = 'o';
  String cityName = 'i';
  String zipCode = 'z';
  String stName = 's';

  Future<void> addAddress() {
    // Call the user's CollectionReference to add a new user
    return address1.add({
      'Country Name': coName,
      'City Name': cityName,
      'Zip Code': zipCode,
      'Street Name': stName,
    }).then((value) => print("address Added"));
  }

  Future getUserAddressList() async {
    List aList = [];
    try {
      await address1.get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          aList.add(element.data());
        });
      });
      return aList;
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
          title: Text('Add Adress'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextformField(
                    hintText: 'Country',
                    onSaved: (value) {
                      coName = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: MyTextformField(
                              hintText: 'City',
                              onSaved: (value) {
                                cityName = value;
                              })),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          flex: 1,
                          child: MyTextformField(
                              hintText: 'Zip Code',
                              onSaved: (value) {
                                zipCode = value;
                              })),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyTextformField(
                      hintText: 'Street Name',
                      onSaved: (value) {
                        stName = value;
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: 'Save',
                    textcolor: Colors.white,
                    buttoncolor: Color(0xFF27292E),
                    height: 50,
                    onTap: () async {
                      _formKey.currentState.save();
                      addAddress();

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                  ),
                ],
              ),
            )));
  }
}
