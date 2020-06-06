import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dice1;
  var dice2;
  var diceNumber;
  var imgName = ['one', 'two', 'three', 'four', 'five', 'six'];
  getImage(val) {
    AssetImage img = AssetImage('images/$val.png');
    return img;
  }

  randomNumberGenerator() {
    return Random().nextInt(6);
  }

  diceRoll() {
    var d1 = randomNumberGenerator();
    var d2 = randomNumberGenerator();
    setState(() {
      dice1 = getImage(imgName[d1]);
      dice2 = getImage(imgName[d2]);
      diceNumber = d1 + d2 + 2;
    });
  }

  @override
  void initState() {
    super.initState();
    diceRoll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              diceNumber.toString(),
              style: TextStyle(
                  color: Color(0xFFEFAF11),
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: dice1,
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: dice2,
                    width: 150.0,
                    height: 150.0,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(40.0),
              child: SizedBox(
                height: 80.0,
                width: 200,
                child: RaisedButton(
                  color: Color(0xFFEFAF11),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  onPressed: diceRoll,
                  child: Text(
                    "Roll the Dice!",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decorationColor: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
