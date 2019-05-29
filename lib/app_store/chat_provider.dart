import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/models/chat_message.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:signalr_client/signalr_client.dart';
import 'package:flutter/material.dart';
class ChatProvider with ChangeNotifier  {
  ChatProvider();
  List<ChatMessage> _messages = [];
  List<ChatMessage> getMessages() =>_messages;
  setMessages(List<ChatMessage> chatMessages) => _messages = chatMessages;
  void sendMessage(ChatMessage message){
    //sendMessage to server 
    //then add message to message list
    _messages.add(message);
    notifyListeners();
  }
  List<OnlineUserModel> onlineUser = [];
  HubConnection _connection;
  ChatProvider._() {}
  void addChatMessage(ChatMessage chatMessage) {
    _messages.add(chatMessage);
   
  }
  void sendChatMessage(dynamic outgoingMessage) {
    post("http://localhost:49212/api/chats", body: outgoingMessage)
        .then((response) {
          _messages.add(ChatMessage.fromJson(jsonDecode(response.body) ));
          notifyListeners();
        });
  }


   Future<void> createSignalRConnection() async {
    _connection =
        new HubConnectionBuilder().withUrl("http://10.0.2.2:5001/chat").build();
    await _connection.start();
    
    _connection.invoke("BroadCastMessage");
    _connection.on("ReceiveMessage", (data) {
      var dataFromJson=jsonDecode( jsonEncode(data[0]));
     _messages.add(ChatMessage.fromJson(dataFromJson));
      notifyListeners();
    });
  }
}
