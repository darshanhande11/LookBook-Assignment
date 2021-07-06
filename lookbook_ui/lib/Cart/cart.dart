import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  _buildCartCards(String pName, String pBrand, String pSize, double pPrice,
      bool wishlist, double discount, String imgLocation) {
    double discPrice = pPrice - (discount / 100) * pPrice;
    return Container(
      margin: EdgeInsets.only(top: 30),
      //Row of the complete card which has children image and the info on the right
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //PrdouctImage
          Image.asset(
            imgLocation,
            width: MediaQuery.of(context).size.width/5,
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              //Column Child 1 : ProductInfo grey box Container
              Container(
                width: MediaQuery.of(context).size.width/1.6,
                height: MediaQuery.of(context).size.height/12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.fromLTRB(15,10,15,10),
                child: Column(
                  children: [
                    //1st Row of Product Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pName,
                          style: TextStyle(
                            fontSize: 18,
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
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height:10),
                    //2nd Row of Product Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pBrand,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                        //Discount Row - Nested inside 2nd Row of Product Info 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\u{20B9}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 8,
                              ),
                            ),
                            Text(
                              pPrice.toString(),
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              discount.toString()+'% Off',
                              style: TextStyle(
                                color: Colors.orange[400],
                                fontSize: 15,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              //Column Child 2 : row which has size, cart and wishlist options
              Container(
                width: MediaQuery.of(context).size.width/1.6,
                height: MediaQuery.of(context).size.height/12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/9,
                      height: MediaQuery.of(context).size.height/20,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Center(
                        child: Text(
                          pSize,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width/15,
                          height: MediaQuery.of(context).size.height/25,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.bag_fill,
                              color: Colors.green,
                              size: MediaQuery.of(context).size.height/40,
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width/15,
                          height: MediaQuery.of(context).size.height/25,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: Icon(
                            CupertinoIcons.heart,
                            size: MediaQuery.of(context).size.height/40,
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
    );
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
          margin: EdgeInsets.fromLTRB(50, 0, 15, 30),
          child: Text(
            'Items In your Bag',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCartCards('Breezy Shirt', 'House of Rare', 'XXL', 2300.0, false, 0,'assets/shirt.png'),
            _buildCartCards('Linen Chino', 'High Lander', '32', 1994.0, true, 20.0,'assets/trousers.png'),
            _buildCartCards('White Sneakers', 'Benetton', '9', 1994.0, false, 20.0,'assets/shoes.png'),
          ]
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,15,30,15),
          child: Divider(),
        ),
        SizedBox(height:10),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,15,30,5),
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
                    '4616',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,0,30,15),
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
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                elevation: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,15),
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
