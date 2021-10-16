import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttoncolor;
  final Color textcolor;
  final Function onTap;
  final double height;
  CustomButton(
      {this.text, this.buttoncolor, this.textcolor, this.onTap, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: 350,
          decoration: BoxDecoration(
              color: buttoncolor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textcolor,
              ),
            ),
          ),
        ));
  }
}
