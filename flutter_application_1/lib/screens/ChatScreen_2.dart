import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/widgets/massagaes.dart';
import 'package:flutter_application_1/widgets/new_messages.dart';

class ChatScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[Expanded(child: Massages()), nMessages()],
        ),
      ),
    );
  }
}
