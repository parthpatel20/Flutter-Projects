import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DICE ROLLLER',
      theme:
          ThemeData(primaryColor: Color(0xFFEFAF11), canvasColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text("DICE ROLLER"),
        ),
        body: HomePage(),
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
