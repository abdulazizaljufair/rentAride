import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

bool checkBoxValue = false;

class _AddCardState extends State<AddCard> {
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
        child: Column(
          children: [
            MyTextformField(
              hintText: 'Holder Name',
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 30,
            ),
            MyTextformField(
              hintText: 'Card Number',
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 30,
            ),
            MyTextformField(
              hintText: 'Expire date',
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(
              height: 30,
            ),
            MyTextformField(
              hintText: 'Security Code',
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              buttoncolor: Color(0xFF27292E),
              textcolor: Colors.white,
              text: 'Save',
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
