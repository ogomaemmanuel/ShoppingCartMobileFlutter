import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/product.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeWidgetsState();
  }
}

class _HomeWidgetsState extends State<HomeWidgets> {
  List<ProductModel> hotDeals = new List<ProductModel>();

  @override
  void initState() {
    gethotDeals().then((items) {
      setState(() {
        hotDeals.addAll(items);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var instance = SizedBox(
      height: 150.0,
      // width: 300.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
        images: imgList.map((url) {
          return new NetworkImage(url);
        }).toList(),
      ),
    );

    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: instance,
                );
              }
              var header="";
              return new Container(
                  height: 200.0,
                  child: Column(
                    textDirection:TextDirection.ltr,
                    children: <Widget>[
                      Text("Header $index",
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                      ),
                      new Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hotDeals.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildHotDealWidget(
                                  hotDeals.elementAt(index));
                            }),
                      )
                    ],
                  ));
            },
          ),
        )
      ],
    );
  }

  Widget _buildHotDealWidget(ProductModel productModel) {
    return new Container(
        height: 200,
        width: 200,
        child: Card(
          elevation: 0.0,
            child: Column(
          children: <Widget>[
            Image.network(
              productModel.productMediFile,
              height: 150,
            ),
            Row(
              children: <Widget>[
                Text(productModel.price.toString()),
              ],
            )
          ],
        )));
  }

  Future<List<ProductModel>> gethotDeals() {
    var productList = [
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
    ];
    return new Future(() => productList);
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520588831435-1529e6d7cf5e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fd3d7c35892bd8c7c9e757865a764d4c&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1542356805-7ac8780a5349?ixlib=rb-0.3.5&s=b2e0788ba492e32bce9f969eb451b287&dpr=1&auto=format&fit=crop&w=525&q=60',
    'https://images.unsplash.com/photo-1521020773588-3b28297b1e70?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e0973395dd1655ea3b8fb83fa95c02c2&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1513043069934-38cc6da2ea9f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b1bd8ede4d7c4c79fe67abd96f520814&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1513373319109-eb154073eb0b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c5748b11351ff65472cba9e1c77fb4c&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1520006403909-838d6b92c22e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cd5c81517b22ee13e47484cddb56d16c&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=828346ed697837ce808cae68d3ddc3cf&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d1046925db0fb1f15417d71ad1676880&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1538411393449-2910995cfa42?ixlib=rb-0.3.5&s=97f82ce7461cb69cf2c0308d4e715d66&dpr=1&auto=format&fit=crop&w=525&q=60',
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89e5fd826f8bdc563ab1743608690f39&auto=format&fit=crop&w=500&q=60',
  ];
}
