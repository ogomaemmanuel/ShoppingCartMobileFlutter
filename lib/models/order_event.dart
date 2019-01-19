class OrderEvent {
  DateTime date;
  String location;
  String event;
  OrderEvent._({this.date, this.location, this.event});
  factory OrderEvent.fromJson(Map<String, dynamic> json) {
    return new OrderEvent._(
        date:DateTime.parse(json["date"]) , location: json["location"], event: json["event"]);
  }
}
