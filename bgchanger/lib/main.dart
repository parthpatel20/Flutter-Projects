import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Random Background"),
        ),
        body: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.grey,
    Colors.blueGrey,
    Colors.purple,
  ];

  var randomColor = Colors.white;
  var randomColorForButton = Colors.red;
  rendomGenerator() {
    return Random().nextInt(colors.length);
  }

  setRendomColor() {
    setState(() {
      randomColor = colors[rendomGenerator()];
      randomColorForButton = colors[rendomGenerator()];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: randomColor,
      child: Center(
        child: SizedBox(
          width: 200.0,
          height: 80.0,
          child: RaisedButton(
            color: randomColorForButton,
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              "Change IT",
              style: TextStyle(
                color: randomColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: setRendomColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}
