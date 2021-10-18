import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Edit profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  pickImage();
                },
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF27292E),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 65,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Upload Profile picture'),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextformField(
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyTextformField(
                  hintText: 'Last Name',
                )),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            MyTextformField(
              hintText: 'Email',
            ),
            SizedBox(
              height: 25,
            ),
            MyTextformField(
              hintText: 'Driver Lisence',
            ),
            SizedBox(
              height: 25,
            ),
            MyTextformField(
              hintText: 'Phone Number',
            ),
            SizedBox(
              height: 25,
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
