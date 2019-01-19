import 'package:flutter/material.dart';
import 'package:hello_world/pages/checkout/order_summary.dart';
import 'package:hello_world/pages/login/login.dart';
import 'package:hello_world/pages/orders/order_history.dart';
import 'package:hello_world/pages/products/products.dart';

class SideMenuModel {
  String title;
  IconData icon;
  String page;
  SideMenuModel({this.title, this.icon, this.page});
  Widget get route {
    if (page.toLowerCase() == "productspage") {
      return ProductsPage();
    }
    if (page.toLowerCase() == "logoutpage") {
      return LoginPage();
    }
    if (page.toLowerCase() == "paymentmethodpage") {
      return OrderSummaryPage();
    }
    if (page.toLowerCase() == "orderhistorypage") {
      return OrderHistoryPage();
    }

    return null;
  }
}
