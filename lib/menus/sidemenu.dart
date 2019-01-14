import 'package:flutter/material.dart';
import 'package:hello_world/models/SideMenuModel.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buidMenus(context);
  }

  List<SideMenuModel> menus() {
    var menus = new List.of([
      new SideMenuModel(title: "Home", icon: Icons.home, page: "ProductsPage"),
      new SideMenuModel(
          title: "Logout", icon: Icons.exit_to_app, page: "LogoutPage"),
    ]);
    return menus;
  }

  Widget _buidMenus(BuildContext context) {
    return new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Column(
              children: menus().map((menu) {
            return ListTile(
              title: Text(menu.title),
              leading: Icon(menu.icon),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => menu.route));
              },
            );
          }).toList())
        ],
      ),
    );
  }
}
