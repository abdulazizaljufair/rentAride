import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class ChooseExistingScreen extends StatelessWidget {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          MyTextformField(
            hintText: 'Pick up Date',
            readonly: true,
            keyboardType: TextInputType.datetime,
            suffixIcon: Icon(
              Icons.calendar_today,
              color: Color(0xFF27292E),
            ),
            onTap: () {
              selectDate(context, CupertinoDatePickerMode.date,
                  controller: dateController);
            },
          ),
          SizedBox(
            height: 15,
          ),
          MyTextformField(
            hintText: 'Availabe time',
            keyboardType: TextInputType.datetime,
            controller: timeContoller,
            readonly: true,
            suffixIcon: Icon(
              Icons.access_time,
              color: Color(0xFF27292E),
            ),
            onTap: () {
              selectDate(context, CupertinoDatePickerMode.time,
                  controller: timeContoller);
            },
          ),
          SizedBox(
            height: 15,
          ),
          MyTextformField(
            hintText: 'Price',
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            text: 'List',
            textcolor: Colors.white,
            buttoncolor: Color(0xFF27292E),
            height: 50,
          ),
        ],
      ),
    ));
  }
}
