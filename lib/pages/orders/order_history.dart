import 'package:flutter/material.dart';
import 'package:hello_world/models/order.dart';
import 'package:hello_world/pages/orders/order_details.dart';
import 'package:hello_world/pages/orders/order_tracking.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _OrderHistoryPageState();
  }
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
      ),
      body: orders.length > 0
          ? ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, int index) {
                return buildOrderHistoryItem(
                    Order.fromJson(orders.elementAt(index)), context);
              },
            )
          : Center(child: Text("You have no orders")),
    );
  }

  Widget buildOrderHistoryItem(Order order, context) {
    return new Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text("Order No: ${order.orderNo}"),
          subtitle: Text("Order Date: ${order.orderDate}"),
          trailing: Text("Order total: ${order.orderTotal}"),
          contentPadding: EdgeInsets.all(3.0),
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String selected) {
                _moveToOrderAction(selected, context);
              },
              itemBuilder: (context) {
                return popoverMenuItems.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ],
    ));
  }

  void _moveToOrderAction(String action, BuildContext context) {
    switch (action.toLowerCase()) {
      case "tracking info":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderTracking()));
        break;
      case "view items":
       Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderDetailsPage()));
      break;  
      default:
        break;
    }
  }

  final popoverMenuItems = [
    "Cancel",
    "Tracking Info",
    "View Items",
  ];
  final orders = [
    {
      "orderNo": "1",
      "orderDate": DateTime.now().toString(),
      "orderTotal": 2000
    },
    {
      "orderNo": "2",
      "orderDate": DateTime.now().toString(),
      "orderTotal": 1900
    },
    {
      "orderNo": "3",
      "orderDate": DateTime.now().toString(),
      "orderTotal": 30000
    },
    {
      "orderNo": "4",
      "orderDate": DateTime.now().toString(),
      "orderTotal": 40000
    }
  ];
}
