import 'package:flutter/material.dart';
import 'package:hello_world/models/order_event.dart';

class OrderTracking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _OrderTrackingState();
  }
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order tracking"),
      ),
      body: ListView.builder(
        itemCount: orderTrackingData.length,
        itemBuilder: (context, int index) {
          return buildOrderTracking(
              OrderEvent.fromJson(orderTrackingData.elementAt(index)));
        },
      ),
    );
  }

  Widget buildOrderTracking(OrderEvent orderEvent) {
   
    return new ListTile(
       leading: Text("${orderEvent.date.day}/${orderEvent.date.month}/${orderEvent.date.year}"),
      title: Text(orderEvent.event),
      subtitle: Text(orderEvent.location),
    );
  }

  final orderTrackingData = [
    {
      "date": DateTime.now().toString(),
      "event": "Order Completed",
      "location": "Fedex, SINGAPORE SG"
    },
    {
      "date": DateTime.now().toString(),
      "event": "Order",
      "location": "Order Returned"
    },
    {
      "date": DateTime.now().toString(),
      "event": "Order Packaged",
      "location": "Fedex, SINGAPORE SG"
    },
    {
      "date": DateTime.now().toString(),
      "event": "Order Paid",
      "location": "Fedex, SINGAPORE SG"
    },
    {
      "date": DateTime.now().toString(),
      "event": "Order Created",
      "location": "Fedex, SINGAPORE SG"
    },
  ];
}
