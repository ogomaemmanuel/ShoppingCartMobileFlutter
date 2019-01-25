
import 'package:flutter/material.dart';
import 'package:hello_world/models/cart.dart';
import 'package:hello_world/pages/cart/cart_item.dart';
class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  List<CartModel> productList = new List<CartModel>();
  @override
  void initState() {
    getCartItems().then((value) {
      setState(() {
        productList.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
            onRefresh: () async {
              await new Future.delayed(new Duration(seconds: 3));
            },
            child: ListView.builder(
                itemCount: productList.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return CartItem(productList.elementAt(index));
                }));
  }

  Future<List<CartModel>> getCartItems() {
    var productList = [
      new CartModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new CartModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new CartModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new CartModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
    ];
    return new Future(() => productList);
  }
}
