import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:hello_world/app_store/app_state.dart';
import 'package:hello_world/events/webRtcSignalReceivedEvent.dart';
import 'package:hello_world/main.dart';
import 'dart:core';

import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/models/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

class MakeCallPage extends StatefulWidget {
  final OnlineUserModel onlineUser;
  const MakeCallPage({Key key, this.onlineUser}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _MakeCallState();
  }
}

class _MakeCallState extends State<MakeCallPage> {
  MediaStream _localStream;
  String token = "";
  OnlineUserModel onlineUser; //this the user being called
  RTCPeerConnection pc;
  final RTCVideoRenderer _localRenderer = new RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();
  AuthUserDetails _userLoginDetails;
  bool _inCalling = false;
  @override
  void initState() {
    super.initState();
    eventBus.on<WebebRtcSignalReceivedEvent>().listen((event) {
      if (event.webRTCMessage.type == "answer") {
        _handleAnswer(event);
      }
      if (event.webRTCMessage.type == "candidate") {
        _handleIceCandidate(event);
      }
    });
    onlineUser = widget.onlineUser;
    _userLoginDetails =
        Provider.of<AppState>(context, listen: false).getUserLoginDetails();
    token = _userLoginDetails.accessToken;
    initRenderers();
  }

  @override
  deactivate() {
    super.deactivate();
    if (_inCalling) {
      _hangUp();
    }
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
      body: new OrientationBuilder(
        builder: (context, orientation) {
          return new Center(
              child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: new Container(
                  margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: RTCVideoView(_remoteRenderer),
                  decoration: new BoxDecoration(color: Colors.transparent),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: Container(
                  child: RTCVideoView(_localRenderer),
                  decoration: new BoxDecoration(color: Colors.transparent),
                ),
              ),
            ],
          ));
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _inCalling ? _hangUp : _makeCall,
        tooltip: _inCalling ? 'Hangup' : 'Call',
        child: new Icon(_inCalling ? Icons.call_end : Icons.phone),
      ),
    );
  }

  _hangUp() async {
    try {
      await _localStream.dispose();
      _remoteRenderer.srcObject = null;
      _localRenderer.srcObject = null;
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      _inCalling = false;
    });
  }

  initRenderers() async {
    _localRenderer.objectFit = RTCVideoViewObjectFit.RTCVideoViewObjectFitCover;
    await _localRenderer.initialize();
    _remoteRenderer.objectFit =
        RTCVideoViewObjectFit.RTCVideoViewObjectFitCover;
    await _remoteRenderer.initialize();
  }

  _makeCall() async {
    final Map<String, dynamic> mediaConstraints = {
      "audio": true,
      "video": {
        "mandatory": {
          "minWidth":
              '640', // Provide your own width, height and frame rate here
          "minHeight": '480',
          "minFrameRate": '30',
        },
        "facingMode": "user",
        "optional": [],
      }
    };

    try {
      var stream = await navigator.getUserMedia(mediaConstraints);
      _localStream = stream;
      _localRenderer.srcObject = _localStream;
      //Todo remove remote renderer here, video will come from somewhere
      //_remoteRenderer.srcObject = _localStream;
      _createPeerConnection();
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _inCalling = true;
    });
  }

  sendToServer(Map<String, Object> data) {
    post("$kHostUrl/api/chats/web-rtc-signal",
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token"
            },
            body: jsonEncode(data))
        .then((response) {});
  }

  _handleAnswer(WebebRtcSignalReceivedEvent event) async {
    await pc.setRemoteDescription(new RTCSessionDescription(
        event.webRTCMessage.sdp["sdp"], event.webRTCMessage.sdp["type"]));
  }

  _handleIceCandidate(WebebRtcSignalReceivedEvent event) async {
    await pc.addCandidate(new RTCIceCandidate(
        event.webRTCMessage.candidate["candidate"],
        event.webRTCMessage.candidate["sdpMid"],
        event.webRTCMessage.candidate["sdpMlineIndex"]));
  }

  _createPeerConnection() async {
    pc = await createPeerConnection(_iceServers, _config);
    await pc.addStream(_localStream);
    var localDescription = await pc.createOffer(
        {"offerToReceiveAudio": true, "offerToReceiveVideo": true});
    await pc.setLocalDescription(localDescription);
    sendToServer({
      "to": onlineUser.id,
      "from": _userLoginDetails.userDetails.id,
      "sdp": localDescription,
      "type": "offer"
    });

    pc.onIceCandidate = (candidate) {
      sendToServer({
        "type": "candidate",
        'to': onlineUser.id, //set to userId here
        "from": _userLoginDetails.userDetails.id,
        'candidate': {
          'sdpMLineIndex': candidate.sdpMlineIndex,
          'sdpMid': candidate.sdpMid,
          'candidate': candidate.candidate,
        },
      });
    };

    pc.onIceConnectionState = (state) {};

    pc.onAddStream = (stream) {
      _remoteRenderer.srcObject = stream;
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
}
