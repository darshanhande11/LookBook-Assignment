import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home",backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined), label: "Cart",backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart), label: "Wishlist",backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: "Profile",backgroundColor: Colors.black)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
