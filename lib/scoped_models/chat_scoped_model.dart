import 'package:hello_world/models/online_user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:hello_world/models/chat_message.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:signalr_client/signalr_client.dart';

class ChatScopedModel extends Model {
  ChatScopedModel(){

  }
  List<ChatMessage> messages = [];
  List<OnlineUserModel> onlineUser = [];
  HubConnection connection;
  ChatScopedModel._() {}
  void addChatMessage(ChatMessage chatMessage) {
    messages.add(chatMessage);
    notifyListeners();
  }
  void sendChatMessage(dynamic outgoingMessage) {
    post("http://localhost:49212/api/chats", body: outgoingMessage)
        .then((response) {
          messages.add(ChatMessage.fromJson(jsonDecode(response.body) ));
        });
  }


   Future<void> createSignalRConnection() async {
    connection =
        new HubConnectionBuilder().withUrl("http://10.0.2.2:5001/chat").build();
    await connection.start();
    connection.invoke("BroadCastMessage");
    connection.on("ReceiveMessage", (data) {
      var dataFromJson=jsonDecode( jsonEncode(data[0]));
      messages.add(ChatMessage.fromJson(dataFromJson));
    });
  }
}
