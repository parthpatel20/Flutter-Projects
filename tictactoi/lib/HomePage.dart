import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Import Assets

  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");
  AssetImage cross = AssetImage("images/cross.png");

  var isCrossed = true;
  List<String> gameState; //It contain values of nine boxes
  var isWin;
  String message;

  // TODO: Initilize the empty state for start game

  @override
  void initState() {
    super.initState();
    resetGame();
  }
  // TODO: Play Game Method

  playGame(int index) {
    //index of button

    if (this.gameState[index] == "empty") {
      setState(() {
        this.gameState[index] =
            (this.isCrossed) ? "cross" : "circle"; //reduced Logic
        // if (this.isCrossed) {
        //   this.gameState[index] = "cross";
        // } else {
        //   this.gameState[index] = "circle";
        // }
        this.isCrossed = !this.isCrossed;
        this.checkWin();
      });
    }
  }

  // TODO: Reset Game Method
  resetGame() {
    setState(() {
      this.isWin = false;
      this.gameState = [];
      for (int i = 0; i < 9; i++) {
        this.gameState.add("empty");
      }
      this.message = "";
    });
  }

  //TODO: Get Images for Buttons

  getImage(String val) {
    return (val == 'cross') ? cross : circle;
  }

  delayReset() {
    if (this.isWin) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        resetGame();
      });
    }
  }

  winningResult(String val) {
    setState(() {
      this.isWin = true;
      this.message = "${val.toUpperCase()} IS WINNER";
      delayReset();
    });
  }

  // TODO: Wininng Logic
  checkWin() {
    if (checkWinningPhases(0, 1, 2)) {
      //Row 1
      winningResult(this.gameState[0]);
    } else if (checkWinningPhases(3, 4, 5)) {
      //Row 2
      winningResult(this.gameState[3]);
    } else if (checkWinningPhases(6, 7, 8)) {
      //Row 3
      winningResult(this.gameState[6]);
    } else if (checkWinningPhases(0, 3, 6)) {
      //Col 1
      winningResult(this.gameState[0]);
    } else if (checkWinningPhases(1, 4, 7)) {
      //Col 2
      winningResult(this.gameState[1]);
    } else if (checkWinningPhases(2, 5, 8)) {
      //Col 3
      winningResult(this.gameState[2]);
    } else if (checkWinningPhases(0, 4, 8)) {
      // Cross 1
      winningResult(this.gameState[0]);
    } else if (checkWinningPhases(2, 4, 6)) {
      //Cross 2
      winningResult(this.gameState[2]);
    } else if (!this.gameState.contains('empty')) {
      // Draw
      winningResult("DRAW MATCH");
    }
  }

  bool checkWinningPhases(int v1, int v2, int v3) {
    return ((this.gameState[v1] != 'empty') &&
        (this.gameState[v1] == this.gameState[v2]) &&
        (this.gameState[v2] == this.gameState[v3]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TicTacToi',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(5.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      //mainAxisSpacing: 5.0,
                      //crossAxisSpacing: 5.0
                    ),
                    itemCount: this.gameState.length,
                    itemBuilder: (context, i) => SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: MaterialButton(
                          onPressed: () {
                            if (!this.isWin) {
                              playGame(i);
                            }
                          },
                          child: (this.gameState[i] == 'empty')
                              ? null
                              : Image(
                                  image: getImage(this.gameState[i]),
                                ),
                          shape: Border.all(
                              color: Colors.black, style: BorderStyle.solid),
                          minWidth: 4.0,
                        )))),
            Text(
              this.message,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: MaterialButton(
                minWidth: 100,
                color: Colors.lightBlue,
                height: 50,
                child: Text(
                  'Reset Game',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                onPressed: () => {resetGame()},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
            Container(
              child: Text(
                'theparthpatel.in',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(20.0),
            )
          ],
        ),
      ),
    );
  }
}
