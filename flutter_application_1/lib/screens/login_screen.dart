import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/screens/create_account_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Image.asset(
                      'images/login.jpg',
                      height: 130,
                      width: 130,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Rent A Ride',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF27292E),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enjoy Your Journey',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextformField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Your Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextformField(
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
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
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot passward',
                      style: TextStyle(fontSize: 16),
                    ),
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
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ButtonNavController()));
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccountScreen()));
                    },
                    child: Text(
                      'Dont have Account? Register',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
