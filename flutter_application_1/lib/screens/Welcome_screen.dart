import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/create_account_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              height: 350,
            ),
            CustomButton(
              text: 'Get Started',
              textcolor: Colors.white,
              buttoncolor: Colors.black,
              height: 50,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CreateAccountScreen()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Login',
              textcolor: Colors.white,
              buttoncolor: Colors.black,
              height: 50,
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
