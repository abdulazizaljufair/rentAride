import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/screens/chats_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(name: "aziz", imagepath: 'images/avatar1.jpg'),
    UserModel(name: "alwaleed", imagepath: 'images/avatar1.jpg'),
    UserModel(name: "khalid", imagepath: 'images/avatar1.jpg'),
    UserModel(name: "nasser", imagepath: 'images/avatar1.jpg'),
    UserModel(name: "john", imagepath: 'images/avatar.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF27292E),
          title: Text(
            'Chats',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatsDetailsScreen(
                              userModel: users[index],
                            )));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 30, bottom: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 30.h,
                      backgroundImage: AssetImage(users[index].imagepath),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      users[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 3,
            );
          },
        ));
  }
}
