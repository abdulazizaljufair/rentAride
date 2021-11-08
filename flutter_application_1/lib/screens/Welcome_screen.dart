import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/create_account_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('height');
    print(MediaQuery.of(context).size.height);
    print('width');
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/background.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Rent A Ride',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 350.h,
            ),
            CustomButton(
              text: 'Get Started',
              textcolor: Colors.white,
              buttoncolor: Colors.black,
              height: 50.h,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CreateAccountScreen()));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: 'Login',
              textcolor: Colors.white,
              buttoncolor: Colors.black,
              height: 50.h,
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
