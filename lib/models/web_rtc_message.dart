class WebRTCMessage {
  String to;
  String from;
  String type; //can be offer, answer,candidate,hung-up
  Map<dynamic, dynamic> sdp;
  Map<dynamic, dynamic> candidate;
  WebRTCMessage._({this.to, this.from, this.type, this.sdp, this.candidate});

  factory WebRTCMessage.fromJson(Map<String, dynamic> json) {
    return new WebRTCMessage._(
      candidate: json["id"],
       to: json['to'],
       from: json["from"],
       type: json["type"],
       sdp: json["sdp"],
       );
  }
}
