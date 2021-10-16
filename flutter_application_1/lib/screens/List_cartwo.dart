import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class ListCarTWO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'List Car',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            MyTextformField(
              hintText: 'Pick up Date',
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the date';
                }
                return null;
              },
              suffixIcon: Icon(
                Icons.calendar_today,
                color: Color(0xFF27292E),
              ),
              onTap: () {
                selectDate(context, CupertinoDatePickerMode.date);
              },
            ),
            SizedBox(
              height: 15,
            ),
            MyTextformField(
              hintText: 'Availabe time',
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the time';
                }
                return null;
              },
              suffixIcon: Icon(
                Icons.access_time,
                color: Color(0xFF27292E),
              ),
              onTap: () {
                selectDate(context, CupertinoDatePickerMode.time);
              },
            ),
            SizedBox(
              height: 15,
            ),
            MyTextformField(
              hintText: 'Price',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the price';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'List',
              buttoncolor: Color(0xFF27292E),
              textcolor: Colors.white,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
