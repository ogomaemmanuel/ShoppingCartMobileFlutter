import 'package:flutter/material.dart';
import 'package:hello_world/pages/checkout/payment_methods.dart';

class OrderSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.arrow_back),
            expandedHeight: 100.0,
            pinned: true,
            floating: false,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Cart Summary",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
              background: Image.network(
                'https://placeimg.com/480/320/any',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              buildbillingAddress(),
              buildCartSummary(),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[Text("Select Payment Method")],
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(height: 100, child: PaymentMethods()),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ButtonBar(
                children: <Widget>[
                  MaterialButton(
                    child: Text(
                      "Proceed To Checkout",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  )
                ],
              )
              // Row(
              //   children: <Widget>[],
              // )
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildbillingAddress() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Billing Address",
          textAlign: TextAlign.start,
        ),
        Card(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: bilingAddressData.keys.map((key) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Text(
                          "$key:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(bilingAddressData[key],
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ],
                );
              }).toList()),
        ),
      ],
    );
  }

  Widget buildCartSummary() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Cart Summary",
          textAlign: TextAlign.start,
        ),
        Card(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: cartSummaryData.keys.map((key) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Text(
                          "$key:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(cartSummaryData[key],
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ],
                );
              }).toList()),
        ),
      ],
    );
  }

  final cartSummaryData = {
    "Items": "4",
    "Total": "100",
  };
  final bilingAddressData = {
    "Full Name": "Emmanuel Ogoma",
    "Email": "ogoma.emmanuel@gmail.com",
    "Address": "542 W. 15th Street",
    "City": "New York",
    "State": "NY",
    "Zip": "10001"
  };
}
