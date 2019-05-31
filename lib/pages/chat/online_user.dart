import 'package:flutter/material.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/pages/chat/chart_page.dart';

class OnlineUserWidget extends StatelessWidget {
  final OnlineUserModel onlineUser;
  OnlineUserWidget({this.onlineUser});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          child: ListTile(
        title: Text(onlineUser.firstName),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(onlineUser.imageUrl),
        ),
      )),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatPage(onlineUser: onlineUser);
        }));
      },
    );
  }
  //ChatBox
}
