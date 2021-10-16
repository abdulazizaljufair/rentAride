import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ); // home: Scaffold());
  }
}
