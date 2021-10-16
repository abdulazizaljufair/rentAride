import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';

class TimeDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('16/4/2021'),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                selectDate(context, CupertinoDatePickerMode.date);
              },
              icon: Icon(
                Icons.arrow_drop_down_circle_sharp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text('10:30 PM'),
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  selectDate(context, CupertinoDatePickerMode.time);
                },
                icon: Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  color: Colors.grey,
                )),
          ],
        ),
      ],
    );
  }
}
