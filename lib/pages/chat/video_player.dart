import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/models/chat_message.dart';
import 'package:video_player/video_player.dart';
import "../../main.dart";
import 'package:chewie/chewie.dart';

// class CustomVideoPlayer extends StatefulWidget {
//   final ChatMessage chatMessage;
//   CustomVideoPlayer({Key key, this.chatMessage}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return _VideoPlayerState();
//   }
// }

class CustomVideoPlayer extends StatefulWidget {
  final ChatMessage chatMessage;
  CustomVideoPlayer({Key key, this.chatMessage}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }
}

class _VideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController _controller;
  VoidCallback listener;
  ChewieController _chewieController;
  //int _position=0;
  @override
  void initState() {
    _controller =
        VideoPlayerController.network(kHostUrl + widget.chatMessage.message);
        // ..addListener((){
        // //_position=  _controller.value.position.inMicroseconds;
        // });
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 3 / 2,
      //autoInitialize: false,
      autoPlay: false,
     // looping: false,
       autoInitialize: true,
                looping: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if(_position>0){
    //   _chewieController.seekTo(Duration(microseconds: _position));
    //   _chewieController.play();
    //   return Center(child: Chewie(controller: _chewieController));
    // }
    
    return Center(child: Chewie(controller: _chewieController));
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
