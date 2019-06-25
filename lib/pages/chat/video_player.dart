import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/models/chat_message.dart';
import 'package:video_player/video_player.dart';
import "../../main.dart";
import 'package:chewie/chewie.dart';

class CustomVideoPlayer extends StatefulWidget {
  final ChatMessage chatMessage;
  CustomVideoPlayer({Key key, this.chatMessage}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }
}

class _VideoPlayerState extends State<CustomVideoPlayer> {
  ChatMessage _chatMessage;
  VideoPlayerController _controller;
  VoidCallback listener;
  ChewieController chewieController;
  @override
  void initState() {
    _controller =
        VideoPlayerController.network(kHostUrl + widget.chatMessage.message);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Chewie(
            controller: ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
