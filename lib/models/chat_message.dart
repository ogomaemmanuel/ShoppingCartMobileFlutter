class ChatMessage {
  String id;
  String message;
  String type;
  String fromId;
  String toId;
  DateTime createdAt;
  DateTime updatedAt;
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
