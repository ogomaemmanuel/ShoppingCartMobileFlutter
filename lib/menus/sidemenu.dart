import 'package:flutter/material.dart';
import 'package:hello_world/app_store/app_state.dart';
import 'package:hello_world/models/SideMenuModel.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
  
    return _buidMenus(context);
  }

  List<SideMenuModel> menus() {
    var menus = new List.of([
      new SideMenuModel(
          title: "Checkout",
          icon: Icons.shopping_basket,
          page: "PaymentMethodPage"),
      new SideMenuModel(
          title: "Order History",
          icon: Icons.history,
          page: "OrderHistoryPage"),
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
              color: Theme.of(context).primaryColor,
            ),
          ),

          Consumer<AppState>(builder: (context,appstate,widget){
           return Column(
              children: menus().map((menu) {
            return ListTile(
              title: Text(menu.title),
              leading: Icon(menu.icon),
              onTap: () {
                if(menu.page.toLowerCase()=="LogoutPage".toLowerCase()){
                  appstate.logout();
                  //Navigator.defaultRouteName reflects the route that the application was started with. Here is the piece of code that illustrates it in more detail:
                Navigator.popUntil(context,  ModalRoute.withName(Navigator.defaultRouteName));

                }
                else{
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => menu.route));
                }
              },
            );
          }).toList());
          }),
          
          Divider(),
          ListTile(
            title: Text("About Us"),
            leading: Icon(Icons.help),
          )
        ],
      ),
    );
  }
}
