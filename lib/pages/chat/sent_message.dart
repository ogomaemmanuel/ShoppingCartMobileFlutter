import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_world/models/chat_message.dart';
import 'package:hello_world/pages/chat/video_player.dart';

class SentMessage extends StatelessWidget {
  final ChatMessage chatMessage;
  SentMessage({this.chatMessage});
  @override
  Widget build(BuildContext context) {
    if (chatMessage.type == "img") {
      return Card(
          child: Center(
        child: Image.memory(base64.decode(
            chatMessage.message.replaceAll("data:image/png;base64,", ""))),
      ));
    }
    else if (chatMessage.type=="video") {
      return CustomVideoPlayer(key:ValueKey(chatMessage.message),chatMessage: chatMessage);
    } else
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Material(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                width: 230.0,
                child: Text(chatMessage.message,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      );
  }
}
