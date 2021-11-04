import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class ManageAdress extends StatelessWidget {
  CollectionReference address1 = FirebaseFirestore.instance.collection('Cards');
  String cName = "c";
  String cityName = 'C';
  String zCode = 'z';
  String sName = 's';

  Future<void> addAddress() {
    // Call the user's CollectionReference to add a new user
    return address1.add({
      'Country Name': cName,
      'City Name': cityName,
      'Zip Code': zCode,
      'Street Name': sName,
    });
  }

  Future getUserAddressList() async {
    List aList = [];
    try {
      await address1.get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          aList.add(element.data);
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
          child: Column(
            children: [
              MyTextformField(
                hintText: 'Country',
                onSaved: (value) {
                  cName = value;
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
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 1,
                      child: MyTextformField(
                          hintText: 'Zip Code',
                          onSaved: (value) {
                            cName = value;
                          })),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              MyTextformField(
                  hintText: 'Street Name',
                  onSaved: (value) {
                    cName = value;
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
                  addAddress();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ],
          ),
        ));
  }
}
