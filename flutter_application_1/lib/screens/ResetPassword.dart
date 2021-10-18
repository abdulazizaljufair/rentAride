import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            MyTextformField(
              hintText: 'Current Password',
              keyboardType: TextInputType.number,
              obscure: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Your Password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            MyTextformField(
              hintText: 'New Password',
              keyboardType: TextInputType.number,
              obscure: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Your Password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            MyTextformField(
              hintText: 'Confirm Password',
              keyboardType: TextInputType.number,
              obscure: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Your Password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {},
              height: 65,
              buttoncolor: Color(0XFF27292E),
              textcolor: Colors.white,
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
