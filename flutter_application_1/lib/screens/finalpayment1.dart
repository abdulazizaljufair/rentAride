import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/screens/sucessbook.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Paymentcar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Payment',
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
              height: 30.h,
            ),
            MyTextformField(
              hintText: 'Card Number',
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 30.h,
            ),
            MyTextformField(
              hintText: 'Expire date',
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(
              height: 30.h,
            ),
            MyTextformField(
              hintText: 'Security Code',
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              buttoncolor: Color(0xFF27292E),
              textcolor: Colors.white,
              text: 'Pay',
              height: 50.h,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Payment Complete",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              'images/payment.jpg',
                              height: 120.h,
                              width: 120.w,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              width: 100.w,
                              child: CustomButton(
                                buttoncolor: Color(0xFF27292E),
                                textcolor: Colors.white,
                                text: 'Ok',
                                height: 50.h,
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ButtonNavController()));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
//Navigator.pushReplacement(context,
//MaterialPageRoute(builder: (context) => ConfirmBooking()));
