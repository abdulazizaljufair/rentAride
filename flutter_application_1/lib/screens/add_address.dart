import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class ManageAdress extends StatelessWidget {
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
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              MyTextformField(
                hintText: 'Street Name',
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Save',
                textcolor: Colors.white,
                buttoncolor: Color(0xFF27292E),
                height: 50,
              ),
            ],
          ),
        ));
  }
}
