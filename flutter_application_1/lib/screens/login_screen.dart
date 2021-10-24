import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/button_nav_controller.dart';
import 'package:flutter_application_1/screens/create_account_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var _userEmail = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      print(_userEmail);
      print(_userPassword);
    }
  }

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
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userEmail = value;
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextformField(
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscure: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return 'Please enter a valid password';
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
                        _trySubmit();
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
