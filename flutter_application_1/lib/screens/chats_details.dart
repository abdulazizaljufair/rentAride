import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/widgets/my_text_field.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';

class ChatsDetailsScreen extends StatelessWidget {
  final UserModel userModel;

  const ChatsDetailsScreen({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: AssetImage(userModel.imagepath),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              userModel.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return ChatBubble(
                      clipper: ChatBubbleClipper4(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 20),
                      backGroundColor: Color(0XFF27292E),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Text(
                          "hi how are you?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return ChatBubble(
                      clipper:
                          ChatBubbleClipper1(type: BubbleType.receiverBubble),
                      backGroundColor: Color(0xffE7E7ED),
                      margin: EdgeInsets.only(top: 20),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Text(
                          "I am fine thanks for asking",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }
                }),
          ),
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.white,
            child: MyTextformField(
              hintText: 'Message',
            ),
          )
        ],
      ),
    );
  }
}
