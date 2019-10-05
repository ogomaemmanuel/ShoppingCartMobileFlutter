import 'package:flutter/material.dart';
import 'package:flutter_webrtc/rtc_video_view.dart';

class MakeCall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MakeCallState();
  }
}

class _MakeCallState extends State<MakeCall> {
  RTCVideoRenderer _localRenderer = new RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();
  bool _inCalling = false;
  @override
  void initState() {
    super.initState();
    initRenderers();
    // TODO make offer and render video
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('P2P Call'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: null,
            tooltip: 'setup',
          ),
        ],
      ),
    );
  }

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }
}
