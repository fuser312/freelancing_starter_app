import 'package:demo_app/home_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'ad_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Varela',
          ),
      home: HomeScreen(),
    );
  }
}
