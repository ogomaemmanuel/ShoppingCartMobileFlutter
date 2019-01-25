import 'package:flutter/material.dart';
import 'package:hello_world/menus/sidemenu.dart';
import 'package:hello_world/models/product.dart';
import 'package:hello_world/pages/cart/cart.dart';
import 'package:hello_world/pages/chat/online_user_list.dart';
import 'package:hello_world/pages/home/HomeWidgets.dart';
import 'package:hello_world/pages/products/products.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer:  SideMenu(),
          appBar: AppBar(
            title: Text("Masoko.com"),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: "Home",
                  icon: Icon(Icons.home),
                ),
                Tab(
                  text: "Categories",
                  icon: Icon(Icons.category),
                ),
                Tab(
                  text: "Cart",
                  icon: Icon(Icons.shopping_cart),
                ),
                Tab(
                  text: "Favorites",
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  text: "Chats",
                  icon: Icon(Icons.message),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              HomeWidgets(),
              ProductsPage(),
              CartPage(),
              HomeWidgets(),
              OnlineUsersPage()
              ],
          ),
        ));
  }
}
