import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'LookBook',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

