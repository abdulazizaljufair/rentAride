import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class reserveCar extends StatelessWidget {
  TextEditingController fromdatecontroller = TextEditingController();
  TextEditingController todatecontroller = TextEditingController();
  TextEditingController fromtimecontroller = TextEditingController();
  TextEditingController totimecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF27292E),
          title: Text(
            'Reserve Car',
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
                height: 40.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyTextformField(
                      hintText: 'From Date',
                      controller: fromdatecontroller,
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
                        selectDate(context, CupertinoDatePickerMode.date,
                            controller: fromdatecontroller);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: MyTextformField(
                      hintText: 'Until Date',
                      keyboardType: TextInputType.datetime,
                      controller: todatecontroller,
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
                        selectDate(context, CupertinoDatePickerMode.date,
                            controller: todatecontroller);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyTextformField(
                      hintText: 'From time ',
                      controller: fromtimecontroller,
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
                        selectDate(context, CupertinoDatePickerMode.time,
                            controller: totimecontroller);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: MyTextformField(
                      hintText: 'until',
                      controller: totimecontroller,
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
                        selectDate(context, CupertinoDatePickerMode.time,
                            controller: totimecontroller);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomButton(
                text: 'Reserve',
                buttoncolor: Color(0xFF27292E),
                textcolor: Colors.white,
                height: 50.h,
              ),
            ],
          ),
        ));
  }
}
