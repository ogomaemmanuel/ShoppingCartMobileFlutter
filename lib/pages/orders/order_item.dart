import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/cart.dart';
import 'package:hello_world/pages/products/product_details.dart';
import 'package:share/share.dart';

class OrderItem extends StatefulWidget{
   final CartModel product;
   OrderItem({@required this.product});
  @override
  State<StatefulWidget> createState() {
    return new OrderItemState();
  }
}

class OrderItemState extends State<OrderItem>{
 CartModel product;
  @override
    void initState() {
     product=widget.product;
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      child: Card(
        child: Column(
          children: <Widget>[
            Center(
              child: CachedNetworkImage(
                  placeholder:  (context, url) => new CircularProgressIndicator(),
                  imageUrl: product.productMediFile),
            ),
            Center(
              child: Text(product.productName),
            ),
            Center(
                child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Price:",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  Text(product.price.toString()),
                ],
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Quanity:",
                  style: TextStyle(color: Colors.redAccent),
                ),
                Text(product.total.toString()),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share('check out my website https://example.com');
                  },
                )
              ],
            )
          ],
        ),
      ),
      onDoubleTap: _goTodDetail,
    );
  }
  void _goTodDetail() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
  }
}