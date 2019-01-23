import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/widgets/star_rating/star_rating.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProductDetailState();
  }
}

class _ProductDetailState extends State<ProductDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: images.length);
  }

  List<String> images = const [
    "https://www.masoko.com/media/catalog/product/cache/image/700x700/e9c3970ab036de70892d86c6d221abfe/f/i/fiorelli_joanna_large.jpg",
    "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/f/i/fiorelli_laurent_tote_red.jpg",
    "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/r/o/rosetti_crawford_tote_brown.jpg"
  ];
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: images.map((image) {
                  return Image.network(image);
                }).toList(),
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 48.0,
                    alignment: Alignment.center,
                    child: TabPageSelector(controller: _tabController),
                  ),
                ),
                Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Chip(label: Text("Reviews 5")),
                    StarRating(),
                  ],
                )
              ],
            )
          ],
        ));
  }

  final Map<int, Widget> segments = const <int, Widget>{
    0: Text("Description"),
    1: Text("Reviews")
  };

  final Map<int, Widget> productInfo = const <int, Widget>{
    0: Text(
        "The IdeaPad 120s is a modern, stylish portable the laptop computer at only 1.15 kg. It’s perfect for every day tasks, and the HD screen looks incredible. If you’re looking for reliable processing power combined with high performance, the 120s is a perfect companion for work and play. Life is hectic, and the last thing you want to worry about is running out of battery. IdeaPad 120S offers over 8 hours of battery life.Stream content quickly and easily from your Lenovo 100 to a television or other display."),
    1: Text("dumyyyydydy")
  };
}
