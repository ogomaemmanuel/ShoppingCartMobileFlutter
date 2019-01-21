import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/cart.dart';
import 'package:hello_world/models/product.dart';
import 'package:hello_world/pages/products/product_details.dart';
import 'package:share/share.dart';

class CartItem extends StatefulWidget {
  final CartModel product;
  CartItem(this.product);
  @override
  State<StatefulWidget> createState() {
    return new _CartItemState();
  }
}

class _CartItemState extends State<CartItem> {
  CartModel product;
  @override
  void initState() {
    product = widget.product;
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
                  placeholder: CircularProgressIndicator(),
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
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decrementTotal,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _incrementTotal,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => {},
                ),
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

  void _incrementTotal() {
    setState(() {
      product.total += 1;
    });
  }

  void _decrementTotal() {
    if (product.total > 0 && product.total != 1) {
      setState(() {
        product.total -= 1;
      });
    }
  }

  void _goTodDetail() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
  }
}
