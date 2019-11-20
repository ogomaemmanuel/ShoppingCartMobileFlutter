import 'package:flutter/material.dart';
import 'package:hello_world/events/webRtcSignalReceivedEvent.dart';
import 'package:hello_world/menus/sidemenu.dart';
import 'package:hello_world/pages/cart/cart.dart';
import 'package:hello_world/pages/chat/online_user_list.dart';
import 'package:hello_world/pages/home/HomeWidgets.dart';
import 'package:hello_world/pages/products/products.dart';
import 'package:hello_world/pages/qr_code_login/qr_code_ligin.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
@override
void initState() {
   super.initState();
    eventBus.on<WebebRtcSignalReceivedEvent>().listen((event) {
      if (event.webRTCMessage.type == "offer") {
        _askedToLead();
      }
  });
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer: SideMenu(),
          appBar: AppBar(
            title: Text("MyDuka.com"),
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        child: GestureDetector(
                      child: Text("Web Login"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScanScreen()),
                        );
                      },
                    ))
                  ];
                },
              )
            ],
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

  Future<void> _askedToLead() async {
  switch (await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('You have a new call'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () { Navigator.pop(context, true); },
            child: const Text('Accept'),
          ),
          SimpleDialogOption(
            onPressed: () { Navigator.pop(context, false); },
            child: const Text('Reject'),
          ),
        ],
      );
    }
  )) {
    case true:
      // Let's go.
      // ...
    break;
    case false:
      // ...
    break;
  }
}
}
