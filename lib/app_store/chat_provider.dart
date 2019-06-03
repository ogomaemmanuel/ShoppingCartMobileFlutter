import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/models/chat_message.dart';
import 'package:hello_world/models/user.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:signalr_client/signalr_client.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  bool _isConnected = false;
  ChatProvider();
  List<ChatMessage> _messages = [];
  List<ChatMessage> getMessages() => _messages;
  HubConnection _connection;
  String token="";
  List<OnlineUserModel> _onlineUsers = [];
  bool getIsConnected() {
    return _isConnected;
  }

  List<OnlineUserModel> getOnlinerUsers() {
    return _onlineUsers;
  }

  ChatProvider._() {}
  void addChatMessage(ChatMessage chatMessage) {
    _messages.add(chatMessage);
  }

  void sendChatMessage(Map<String,dynamic> outgoingMessage) {
    post("http://10.0.2.2:49615/api/chats",
            headers: {"Content-Type": "application/json","Authorization":"Bearer $token"},
            body: jsonEncode(outgoingMessage))
        .then((response) {
      _messages.add(ChatMessage.fromJson(jsonDecode(response.body)));
      notifyListeners();
    });
  }

  Future<void> createSignalRConnection(AuthUserDetails authUserDetails) async {
    token=authUserDetails.accessToken;
    _connection = new HubConnectionBuilder()
        .withUrl(
            "http://10.0.2.2:49615/signalr/notification-hub?token=$token")
        .build();
    await _connection.start();
    _isConnected = true;
    //this is for streaming data from the server,
    //the stream method takes the server method name and the list of arguments sent arguments
    //_connection.stream("methodName",[]).listen(onData)

    _connection.invoke("RegisterUser", args: [authUserDetails]);
    _connection.on("MessageToUser", (data) {
      var dataFromJson = jsonDecode(jsonEncode(data[0]));
      _messages.add(ChatMessage.fromJson(dataFromJson));
      notifyListeners();
    });
    _connection.on("UpdatedUserList", (data) {
      List<dynamic> json = data[0];
      _onlineUsers.clear();
      json.forEach((item) {
        _onlineUsers.add(OnlineUserModel.fromJson(item));
      });
      _onlineUsers = _onlineUsers
          .where((user) => user.id != authUserDetails.userDetails.id)
          .toList();
      notifyListeners();
    });
  }
}
