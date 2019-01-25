import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/pages/chat/received_message.dart';
import 'package:hello_world/pages/chat/sent_message.dart';

class ChatBox extends StatelessWidget {
  final OnlineUserModel onlineUser;

  const ChatBox({Key key, this.onlineUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(onlineUser.firstName),
        ),
        body: Column(
          children: <Widget>[
            new Flexible(
              child:ListView.builder(
              itemCount: 70,
              itemBuilder: (context, int index) {
                double cWidth = MediaQuery.of(context).size.width * 0.8;
                if (index % 2 == 0) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    width: cWidth,
                    child: 
                   ReceivedMessage(
                      message: "Received Chat message $index")
                  );
                }
                return Container(
                    padding: const EdgeInsets.all(16.0),
                    width: cWidth,
                    child: SentMessage(
                        message:
                            "Received Tooojajajsjajsjasasjajsjajsjaas looong text Chat message $index"));
              },
            )
            ),
            Row(

                children: <Widget>[
                   IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: (){},
                  ),
                  Expanded(
                    child: TextFormField(
                        autofocus: false,

                        decoration: new InputDecoration(
                          labelText: "Type a message",
                        ),
                        keyboardType: TextInputType.text),
                  ),
                  Icon(
                    FontAwesomeIcons.microphone,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            
          ],
        ));
  }
}
