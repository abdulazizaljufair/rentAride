import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/functions.dart';
import 'package:flutter_application_1/screens/Edit_profile.dart';
import 'package:flutter_application_1/screens/ResetPassword.dart';

class ManageProfile extends StatefulWidget {
  @override
  _ManageProfileState createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
  bool enablenotifications = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27292E),
        title: Text(
          'Manage Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SwitchListTile(
            title: Text('Enable/Disable Notifications'),
            value: enablenotifications,
            onChanged: (value) {
              enablenotifications = value;
              setState(() {});
            },
          ),
          Divider(
            height: 20,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResetPassword()));
            },
            title: Text('Reset Password'),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
          Divider(
            height: 20,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
            title: Text('Edit Profile'),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
          Divider(
            height: 20,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              showMyDialog(
                  context: context,
                  primarytitle: 'Are you sure',
                  button1title: 'Yes',
                  button2title: 'No',
                  onPressedButton1: () {
                    Navigator.pop(context);
                  },
                  onPressedButton2: () {
                    Navigator.pop(context);
                  });
            },
            title: Text('Delete Account'),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
