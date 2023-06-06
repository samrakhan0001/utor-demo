import 'package:flutter/material.dart';


import 'ViewModel/HomeScreen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Utor Demo',
      home: HomeScreen(),
    );
  }
}
