class Order{
  int orderNo;
  int orderTotal;
  DateTime orderDate;
  Order._({this.orderNo,this.orderTotal,this.orderDate});
   factory Order.fromJson(Map<String, dynamic> json) {
    return new Order._(
      orderNo:int.parse(json['orderNo']) ,
      orderTotal: json['orderTotal'],
      orderDate:DateTime.parse( json["orderDate"]) ,
    );
  }
}