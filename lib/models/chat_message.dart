class ChatMessage {
  int id;
  String message;
  String type;
  int fromId;
  int toId;
  String createdAt;
  String updatedAt;
  String fromUserName;
  String toUserName;
  ChatMessage._(
      {this.id,
      this.message,
      this.type,
      this.fromId,
      this.toId,
      this.createdAt,
      this.updatedAt,
      this.fromUserName,
      this.toUserName});
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return new ChatMessage._(
      id: json["id"],
      message: json["message"],
      type: json["type"],
      fromId: json["fromId"],
      toId: json["toId"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      fromUserName:json["fromUserName"],
      toUserName: json["toUserName"]
    );
  }
}
