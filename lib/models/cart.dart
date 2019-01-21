class CartModel {
  double price;
  String productName;
  String productMediFile;
  int shopperReview;
  int total;
  CartModel(
      {this.price,
      this.productName,
      this.productMediFile,
      this.shopperReview,
      this.total=1});
}
