import 'package:booksi/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Booksi',
    theme: ThemeData(
    primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomePage(),
    );
  }
}


