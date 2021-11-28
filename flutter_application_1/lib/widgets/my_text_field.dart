import 'package:flutter/material.dart';

class MyTextformField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onTap;
  final Function onSaved;
  final Function onChanged;
  final bool obscure;
  final bool readonly;
  final TextInputType keyboardType;
  final Widget suffixIcon;
  final TextEditingController controller;
  MyTextformField(
      {this.hintText,
      this.validator,
      this.obscure = false,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.onTap,
      this.controller,
      this.readonly = false,
      this.onSaved,
      this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onTap: onTap == null ? () {} : onTap,
        obscureText: obscure,
        keyboardType: keyboardType,
        onSaved: onSaved,
        onChanged: onChanged,
        controller: controller,
        readOnly: readonly,
        decoration: InputDecoration(
          fillColor: Colors.grey[350],
          filled: true,
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        validator: validator);
  }
}
