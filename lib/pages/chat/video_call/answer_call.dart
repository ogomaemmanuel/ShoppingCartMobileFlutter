import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:hello_world/app_store/app_state.dart';
import 'package:hello_world/events/webRtcSignalReceivedEvent.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/models/user.dart';
import 'package:hello_world/models/web_rtc_message.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../main.dart';

class AnswerCall extends StatefulWidget {
  final OnlineUserModel onlineUser;
  WebRTCMessage webTrcMessage;
  AnswerCall({this.webTrcMessage, this.onlineUser});
  @override
  State<StatefulWidget> createState() {
    return _AnswerCallState();
  }
}

class _AnswerCallState extends State<AnswerCall> {
  WebRTCMessage webRtcMessage;
  MediaStream _localStream;
  OnlineUserModel onlineUser;
  RTCPeerConnection pc;
  String token = "";
  AuthUserDetails _userLoginDetails;
  final RTCVideoRenderer _localRenderer = new RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();
  bool _inCalling = false;
  @override
  void initState() {
    super.initState();
    eventBus.on<WebebRtcSignalReceivedEvent>().listen((event) {
      if (event.webRTCMessage.type == "candidate") {
        _handleIceCandidate(event.webRTCMessage);
      }
    });
    onlineUser = widget.onlineUser;
    webRtcMessage = widget.webTrcMessage;
    _userLoginDetails =
        Provider.of<AppState>(context, listen: false).getUserLoginDetails();
    token = _userLoginDetails.accessToken;
    initRenderers();
    createPeerConnection(_iceServers, _config).then((con) {
      pc = con;
      pc.onAddStream = (stream) {
        _remoteRenderer.srcObject = stream;
      };
      pc.onIceCandidate = (candidate) {
        sendToServer({
          "type": "candidate",
          'to': onlineUser.id, //set to userId here
          "from": _userLoginDetails.userDetails.id,
          'candidate': {
            'sdpMLineIndex': candidate.sdpMlineIndex,
            'sdpMid': candidate.sdpMid,
            'candidate': candidate.candidate,
          }
        });
        //  vm.myPeerConnection.on

        //createAnswer;
      };
       _createAnswer();
    });
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
        onPressed: _hangUp,
        tooltip: _inCalling ? 'Hangup' : 'Call',
        child: new Icon(_inCalling ? Icons.call_end : Icons.phone),
      ),
    );

    // TODO: implement build
    return null;
  }

  initRenderers() async {
    _localRenderer.objectFit = RTCVideoViewObjectFit.RTCVideoViewObjectFitCover;
    await _localRenderer.initialize();
    _remoteRenderer.objectFit =
        RTCVideoViewObjectFit.RTCVideoViewObjectFitCover;
    await _remoteRenderer.initialize();
  }

  _createAnswer() async {
    RTCSessionDescription remoteSessionDescription = new RTCSessionDescription(
        webRtcMessage.sdp["sdp"], webRtcMessage.sdp["type"]);
    await pc.setRemoteDescription(remoteSessionDescription);
    var stream = await navigator.getUserMedia(_mediaConstraints);
    _localStream = stream;
    _localRenderer.srcObject = _localStream;
    pc.addStream(stream);
    RTCSessionDescription localSessionDescription =
        await pc.createAnswer(_constraints);
    await pc.setLocalDescription(localSessionDescription);
    sendToServer({
      "to": webRtcMessage.from,
      "from": webRtcMessage.to, //vm.auth.userDetails.id,
      "sdp": localSessionDescription.toMap(),
      "type": "answer"
    });
    //Todo remove remote renderer here, video will come from somewhere
    //_remoteRenderer.srcObject = _localStream;
  }

  sendToServer(Map<String, Object> data) {
    print("making sendToServer call");
    post("$kHostUrl/api/chats/web-rtc-signal",
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token"
            },
            body: jsonEncode(data))
        .then((response) {});
  }

  _handleIceCandidate(WebRTCMessage webRTCMessage) {
    pc.addCandidate(new RTCIceCandidate(
        webRTCMessage.candidate["candidate"],
        webRTCMessage.candidate["sdpMid"],
        int.parse(webRTCMessage.candidate["sdpMLineIndex"])));
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

  Map<String, dynamic> _iceServers = {
    'iceServers': [
      {"urls": "stun:stun4.l.google.com:19302"}
    ]
  };
  final Map<String, dynamic> _config = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true},
    ],
  };
  final Map<String, dynamic> _constraints = {
    'mandatory': {
      'OfferToReceiveAudio': true,
      'OfferToReceiveVideo': true,
    },
    'optional': [],
  };

  final Map<String, dynamic> _mediaConstraints = {
    "audio": true,
    "video": {
      "mandatory": {
        "minWidth": '640', // Provide your own width, height and frame rate here
        "minHeight": '480',
        "minFrameRate": '30',
      },
      "facingMode": "user",
      "optional": [],
    }
  };
}
