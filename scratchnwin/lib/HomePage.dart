import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Todo: Import Assets

  AssetImage circle = AssetImage('images/circle.png');
  AssetImage lucky = AssetImage('images/doller.png');
  AssetImage unlucky = AssetImage('images/sadFace.png');

//Todo: Get Item Array
  List<String> itemArray;
  int luckyNumber;
  String message;
  int counter = 0;
  bool isWon = false;
//Todo: Init Array in State
  @override
  void initState() {
    super.initState();
    setState(() {
      itemArray = List<String>.generate(
          25, (index) => "empty"); //At init time use Generate
      luckyNumber = generateRandomNumber();
      message = "5 Attempts Only";
    });
  }

  int generateRandomNumber() {
    return Random().nextInt(25);
    //print(random);
  }

  //Get Image Method

  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }

  //Play Game Method

  playGame(int index) {
    if (counter < 5) {
      counter++;
      if (luckyNumber == index) {
        setState(() {
          itemArray[index] = "lucky";
          message = "Congratulation!! You Won";
          isWon = true;
        });
      } else {
        setState(() {
          itemArray[index] = "unlucky";
          var count = 5 - counter;
          message = (count == 0) ? "Opps! You Lost" : "$count Attempts left";
        });
      }
    } else {
      setState(() {
        message = "Opps! You Lost";
      });
    }
  }
  // Show All

  showAll() {
    setState(() {
      itemArray = List.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  //Reset
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(
          25, "empty"); // When you want to modify use filled after init.
      luckyNumber = generateRandomNumber();
      message = "5 Attempts Only";
      counter = 0;
      isWon = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Scratch & Win'),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: Colors.yellow[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0),
                  itemCount: 25,
                  itemBuilder: (context, i) => SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: RaisedButton(
                          color: Colors.yellow[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Image(
                            image: this.getImage(i),
                          ),
                          onPressed: () {
                            if (!isWon) {
                              this.playGame(i);
                            }
                          },
                        ),
                      )),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(7.0),
              child: RaisedButton(
                onPressed: this.showAll,
                child: Text(
                  "Show All",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.yellow[300],
                padding: EdgeInsets.all(10.0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(7.0),
              child: RaisedButton(
                onPressed: this.resetGame,
                child: Text(
                  "Reset",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.yellow[300],
                padding: EdgeInsets.all(7.0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.black,
              child: Center(
                child: Text(
                  "theparthpatel.in",
                  style: TextStyle(
                      color: Colors.yellow[300],
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
