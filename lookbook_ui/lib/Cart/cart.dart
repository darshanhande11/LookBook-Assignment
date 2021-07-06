import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lookbook_ui/Models/product.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> _items = [
    Product(
        pName: 'Breezy Shirt',
        pBrand: 'House of Rare',
        pPrice: 2300,
        pSize: 'XXL',
        discount: 0,
        imgLocation: 'assets/shirt.png',
        wishlist: false,
        cart: true),
    Product(
        pName: 'Linen Chino',
        pBrand: 'HighLander',
        pPrice: 1994,
        pSize: '32',
        discount: 20,
        imgLocation: 'assets/trousers.png',
        wishlist: true,
        cart: true),
    Product(
        pName: 'White Sneakers',
        pBrand: 'Benetton',
        pPrice: 1994,
        pSize: '9',
        discount: 20,
        imgLocation: 'assets/shoes.png',
        wishlist: false,
        cart: true),
  ];
  double _sum = 0;
  _buildCartCards(item) {
    double discPrice = item.pPrice - (item.discount / 100) * item.pPrice;
    setState(() {
      _sum += discPrice;
    });
    return item.cart
        ? Container(
            margin: EdgeInsets.only(top: 30),
            //Row of the complete card which has children image and the info on the right
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //PrdouctImage
                Image.asset(
                  item.imgLocation,
                  width: MediaQuery.of(context).size.width / 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    //Column Child 1 : ProductInfo grey box Container
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        children: [
                          //1st Row of Product Info
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.pName,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              //Price Row - nested Inside 1st Row of Product Info
                              Row(
                                children: [
                                  Text(
                                    '\u{20B9}',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    discPrice.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          //2nd Row of Product Info
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.pBrand,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                ),
                              ),
                              //Discount Row - Nested inside 2nd Row of Product Info
                              item.discount != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '\u{20B9}',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 8,
                                          ),
                                        ),
                                        Text(
                                          item.pPrice.toString(),
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          item.discount.toString() + '% Off',
                                          style: TextStyle(
                                              color: Colors.orange[400],
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    )
                                  : Row(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    //Column Child 2 : row which has size, cart and wishlist options
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: MediaQuery.of(context).size.height / 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 9,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: Center(
                              child: Text(
                                item.pSize,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.pPrice = 0.0;
                                    _sum = 0.0;
                                    item.cart = !item.cart;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey[200]),
                                  child: Icon(
                                    CupertinoIcons.bag_fill,
                                    size:
                                        MediaQuery.of(context).size.height / 40,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.wishlist = !item.wishlist;
                                  });
                                },
                                child: item.wishlist
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.red[50],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Icon(
                                          CupertinoIcons.heart,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Icon(
                                          CupertinoIcons.heart_fill,
                                          color: Colors.red,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container();
  }

  _renderCards() {
    List<Container> allCards = [];
    _items.forEach((item) {
      allCards.add(_buildCartCards(item));
    });
    return allCards;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 12, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  width: 43,
                  height: 43,
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Darshan's Bag",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 32.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(40, 0, 15, 5),
          child: Text(
            'Items In your Bag',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _renderCards()),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
          child: Divider(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\u{20B9}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    _sum.toInt().toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Inclusive of taxes',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                ),
              ),
              Text(
                'Breakdown',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[500],
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(100, 50, 100, 50),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                elevation: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Text(
                  'Check Out',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
