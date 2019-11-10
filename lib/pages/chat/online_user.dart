import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/pages/chat/chart_page.dart';
import 'package:hello_world/pages/chat/video_call/make_call.dart';
class OnlineUserWidget extends StatelessWidget {
  final OnlineUserModel onlineUser;
  OnlineUserWidget({this.onlineUser});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text(onlineUser.firstName),
            leading: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(onlineUser.imageUrl),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatPage(onlineUser: onlineUser);
                }));
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {},
                ),
                SizedBox(width: 2),
                IconButton(
                  icon: Icon(Icons.videocam),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MakeCallPage(onlineUser:onlineUser)));
                  },
                ),
              ],
            )));
  }
  //ChatBox
}
