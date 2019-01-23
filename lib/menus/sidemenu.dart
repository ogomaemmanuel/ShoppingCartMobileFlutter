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
      new SideMenuModel(
          title: "Checkout",
          icon: Icons.exit_to_app,
          page: "PaymentMethodPage"),
      new SideMenuModel(
          title: "Order History",
          icon: Icons.exit_to_app,
          page: "OrderHistoryPage"),
      new SideMenuModel(
          title: "Cart", icon: Icons.exit_to_app, page: "CartPage"),
    ]);
    return menus;
  }

  Widget _buidMenus(BuildContext context) {
    return new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            
            accountName: Text("Emmanuel Ogoma"),
            accountEmail: Text("ogoma.emmanuel@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.eatingdisorderhope.com/wp-content/uploads/2016/01/young-woman-429733_640x426.jpg")),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.eatingdisorderhope.com/wp-content/uploads/2016/01/young-woman-429733_640x426.jpg"),
              )
            ],
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
                Navigator.of(context).pop();
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
