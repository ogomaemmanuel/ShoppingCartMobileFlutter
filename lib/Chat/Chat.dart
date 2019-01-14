import 'dart:async';
import 'package:signalr_client/signalr_client.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  void initState() {
    super.initState();
    chats = new List();
    createSignalRConnection();
  }

  Future<void> createSignalRConnection() async {
    connection =
        new HubConnectionBuilder().withUrl("http://10.0.2.2:5001/chat").build();
    await connection.start();
    connection.invoke("BroadCastMessage");
    connection.on("ReceiveMessage", (data) {
      chats.add(data[0]);
      setState(() {}); 
    });
  }

  List<String> chats;
  HubConnection connection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
        return new Text(chats[index]);
        },
      ),
    );
  }
}
