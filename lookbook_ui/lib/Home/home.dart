import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lookbook_ui/Profile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: "Home",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined),
        label: "Cart",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart),
        label: "Wishlist",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        label: "Profile",
        backgroundColor: Colors.black)
  ];
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 2: Wishlist',
      style: optionStyle,
    ),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: items,
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5,
          backgroundColor: Colors.white,
        ),
      ),
    )
    );
  }
}
