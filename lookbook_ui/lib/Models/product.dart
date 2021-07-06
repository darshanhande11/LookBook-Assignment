class Product {
  String pName, pSize, imgLocation, pBrand;
  double pPrice, discount;
  bool wishlist,cart;
  Product(
      {required this.pName,
      required this.pSize,
      required this.imgLocation,
      required this.pBrand,
      required this.pPrice,
      required this.discount,
      required this.wishlist,
      required this.cart});
}
