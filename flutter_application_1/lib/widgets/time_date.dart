import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeDate extends StatelessWidget {
  TextEditingController fromdatecontroller = TextEditingController();
  TextEditingController fromtimecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fromdatecontroller.text = "2021/3/23";
    fromtimecontroller.text = "10:30 PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 100.w,
              child: TextField(
                readOnly: true,
                controller: fromdatecontroller,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
              onPressed: () {
                selectDate(context, CupertinoDatePickerMode.date,
                    min = min = DateTime.now(), max = DateTime.now(),
                    controller: fromdatecontroller);
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
            SizedBox(
              width: 100.w,
              child: TextField(
                readOnly: true,
                controller: fromtimecontroller,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  selectDate(context, CupertinoDatePickerMode.time,
                      min = DateTime.now(), max = DateTime.now(),
                      controller: fromtimecontroller);
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
