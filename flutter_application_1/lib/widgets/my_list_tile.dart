import 'package:flutter/material.dart';

class Mylist extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const Mylist({Key key, this.icon, this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Color(0xFF27292E),
      ),
      onTap: onTap,
      title: Text(
        title,
      ),
    );
  }
}
