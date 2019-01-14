class ChatViewModel {
  int fromId;
  int toId;
  String message;
  ChatViewModel._({this.fromId, this.toId, this.message});
  factory ChatViewModel.fromJson(Map<String, dynamic> json) {
    return new ChatViewModel._(
        fromId: json['fromId'], toId: json['toId'], message: json['message']);
  }
}
