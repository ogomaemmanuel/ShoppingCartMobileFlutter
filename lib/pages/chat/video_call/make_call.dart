import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/media_stream.dart';
import 'package:flutter_webrtc/rtc_video_view.dart';
import 'package:flutter_webrtc/webrtc.dart';

class MakeCall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MakeCallState();
  }
}

class _MakeCallState extends State<MakeCall> {
  RTCVideoRenderer _localRenderer = new RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();
  MediaStream _localStream;
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

  Future<MediaStream> createStream(media) async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth':
              '640', // Provide your own width, height and frame rate here
          'minHeight': '480',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
        'optional': [],
      }
    };

    MediaStream stream =  await navigator.getUserMedia(mediaConstraints);
    return stream;
  }

  _createPeerConnection(id, media) async {
    if (media != 'data') _localStream = await createStream(media);
    RTCPeerConnection pc = await createPeerConnection(_iceServers,_config);
    if (media != 'data') pc.addStream(_localStream);
    pc.onIceCandidate = (candidate) {
      _send('candidate', {
        'to': id,
        'candidate': {
          'sdpMLineIndex': candidate.sdpMlineIndex,
          'sdpMid': candidate.sdpMid,
          'candidate': candidate.candidate,
        },
    
      });
    };

    pc.onIceConnectionState = (state) {};

    pc.onAddStream = (stream) {
      //if (this.onAddRemoteStream != null) this.onAddRemoteStream(stream);
      //_remoteStreams.add(stream);
    };

    pc.onRemoveStream = (stream) {
     // if (this.onRemoveRemoteStream != null) this.onRemoveRemoteStream(stream);
     // _remoteStreams.removeWhere((it) {
       // return (it.id == stream.id);
     // });
    };

    pc.onDataChannel = (channel) {
     // _addDataChannel(id, channel);
    };

    return pc;
  }

  Map<String, dynamic> _iceServers = {
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'},
      /*
       * turn server configuration example.
      {
        'url': 'turn:123.45.67.89:3478',
        'username': 'change_to_real_user',
        'credential': 'change_to_real_secret'
      },
       */
    ]
  };
   final Map<String, dynamic> _config = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true},
    ],
  };

   _send(event, data) {
    data['type'] = event;
    JsonEncoder encoder = new JsonEncoder();
    //TODO implement send to server functionality
    //if (_socket != null) _socket.add(encoder.convert(data));
    //print('send: ' + encoder.convert(data));
  }
}
