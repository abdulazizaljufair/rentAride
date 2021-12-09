import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/widgets/messagebubble.dart';
import 'new_messages.dart';
import 'messagebubble.dart';

class Massages extends StatelessWidget {
  const Massages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatsSnapshot) {
        if (chatsSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatDocs = chatsSnapshot.data.documents;
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.lenght,
          itemBuilder: (ctx, index) => messageBubble(
              chatDocs[index].data()['text'],
              chatDocs[index].get('userId') ==
                  FirebaseAuth.instance.currentUser.uid),
        );
      },
    );
  }
}
