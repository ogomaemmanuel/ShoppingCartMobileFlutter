import 'package:flutter/material.dart';
import 'package:hello_world/app_store/app_state.dart';
import 'package:hello_world/app_store/chat_provider.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/pages/chat/received_message.dart';
import 'package:hello_world/pages/chat/sent_message.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final OnlineUserModel onlineUser;
  const ChatPage({Key key, this.onlineUser}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage> {
  ScrollController _scrollController = new ScrollController();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OnlineUserModel onlineUser = widget.onlineUser;
    final chatStte = Provider.of<ChatProvider>(context);
    final authstate = Provider.of<AppState>(context);
    final filtredMessages = chatStte.getMessages().where((message) {
      return (message.toId == onlineUser.id &&
              message.fromId ==
                  authstate.getUserLoginDetails().userDetails.id) ||
          (message.toId == authstate.getUserLoginDetails().userDetails.id &&
              message.fromId == onlineUser.id);
    }).toList();
    filtredMessages.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return Scaffold(
        appBar: AppBar(
          title: Text(onlineUser.firstName),
        ),
        body: Column(
          children: <Widget>[
            new Flexible(
                child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              // shrinkWrap: true,
              itemCount: filtredMessages.length,
              itemBuilder: (context, int index) {
                double cWidth = MediaQuery.of(context).size.width * 0.8;
                if (filtredMessages[index].toId ==
                    authstate.getUserLoginDetails().userDetails.id) {
                  return Container(
                      padding: const EdgeInsets.all(16.0),
                      width: cWidth,
                      child:
                          ReceivedMessage(chatMessage: filtredMessages[index]));
                }
                return Container(
                    padding: const EdgeInsets.all(16.0),
                    width: cWidth,
                    child: SentMessage(chatMessage: filtredMessages[index]));
              },
            )),
            // VideoPlayer(),
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
                      controller: myController,
                      decoration: new InputDecoration(
                        labelText: "Type a message",
                      ),
                      keyboardType: TextInputType.text),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    chatStte.sendChatMessage({
                      "to": onlineUser,
                      "from": authstate.getUserLoginDetails().userDetails,
                      "message": myController.text
                    });
                    myController.clear();
                  },
                )
              ],
            ),
          ],
        ));
  }

  @override
  void dispose() {
    myController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
