import 'package:flutter/material.dart';
import 'package:hello_world/app_store/chat_provider.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/pages/chat/online_user.dart';
import 'package:provider/provider.dart';

class OnlineUsersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _OnlineUsersPageState();
  }
}

class _OnlineUsersPageState extends State<OnlineUsersPage> {
  List<OnlineUserModel> onlineUsers = new List<OnlineUserModel>();
  @override
  Widget build(BuildContext context) {
    var onlineUsers = Provider.of<ChatProvider>(context).getOnlinerUsers();
    return Container(
        child: ListView.builder(
      itemCount: onlineUsers.length,
      itemBuilder: (context, int index) {
        return new OnlineUserWidget(onlineUser: onlineUsers.elementAt(index));
      },
    ));
  }

 
}
