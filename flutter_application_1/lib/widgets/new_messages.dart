import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class nMessages extends StatefulWidget {
  nMessages({Key key}) : super(key: key);

  @override
  nMessagesState createState() => nMessagesState();
}

class nMessagesState extends State<nMessages> {
  var eMessage = '';
  final _controller = new TextEditingController();
  void _sendMassge() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': eMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Send a Message'),
            onChanged: (value) {
              setState(() {
                eMessage = value;
              });
            },
          )),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.send,
            ),
            onPressed: eMessage.trim().isEmpty ? null : _sendMassge,
          )
        ],
      ),
    );
  }
}
