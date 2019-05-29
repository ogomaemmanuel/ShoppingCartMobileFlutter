import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_world/app_store/chat_provider.dart';
import 'package:hello_world/models/chat_message.dart';
import 'package:hello_world/pages/chat/received_message.dart';
import 'package:hello_world/pages/chat/sent_message.dart';
import 'package:provider/provider.dart';

class ChartMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ChatProvider>(context);
    return Column(
      children: <Widget>[
        new Flexible(
            child: ListView.builder(
          itemCount: appState.getMessages().length,
          itemBuilder: (context, int index) {
            double cWidth = MediaQuery.of(context).size.width * 0.8;
            if (index % 2 == 0) {
              return Container(
                  padding: const EdgeInsets.all(16.0),
                  width: cWidth,
                  child:
                      ReceivedMessage(message: "Received Chat message $index"));
            }
            return Container(
                padding: const EdgeInsets.all(16.0),
                width: cWidth,
                child: SentMessage(
                    message:
                        "Received Tooojajajsjajsjasasjajsjajsjaas looong text Chat message $index"));
          },
        )),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
            ),
            Expanded(
              child: TextFormField(
                  autofocus: false,
                  decoration: new InputDecoration(
                    labelText: "Type a message",
                  ),
                 
                  keyboardType: TextInputType.text),
            ),
            GestureDetector(child: Icon(
              FontAwesomeIcons.microphone,
              color: Theme.of(context).primaryColor,
      
            ), 
             onTap: (){
               appState.sendMessage(ChatMessage.fromJson({
                 "id":""
               }

               ));
             },
            )
           
          ],
        ),
      ],
    );
  }
}
