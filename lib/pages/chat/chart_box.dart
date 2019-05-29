import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_world/app_store/chat_provider.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/pages/chat/chart_message_list.dart';
import 'package:hello_world/pages/chat/received_message.dart';
import 'package:hello_world/pages/chat/sent_message.dart';
import 'package:provider/provider.dart';
class ChatBox extends StatelessWidget {
  final OnlineUserModel onlineUser;

  const ChatBox({Key key, this.onlineUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final appState = Provider.of<ChatProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(onlineUser.firstName),
        ),
        body:
        ChangeNotifierProvider<ChatProvider>(
        builder: (_) => ChatProvider(),
        child: ChartMessages()));
  }
}
