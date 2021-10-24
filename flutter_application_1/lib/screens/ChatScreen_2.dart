import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Chats/USn1k0Bjijz6L3orFsNR/Massages')
              .snapshots(),
          builder: (ctx, streamSanpshot) {
            if (streamSanpshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = streamSanpshot.data.documents;
            return ListView.builder(
                itemCount: documents.lenght,
                itemBuilder: (ctx, index) => Container(
                      padding: EdgeInsets.all(8),
                      child: Text(documents[index]['text']),
                    ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('Chats/USn1k0Bjijz6L3orFsNR/Massages')
                .add({'text': 'this was adde by clicking the button'});
          },
        ));
  }
}
