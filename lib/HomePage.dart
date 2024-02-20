import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayZX = ["", "", "", "", "", "", "", "", ""];
  bool uTurn = true;
  int score0 = 0;
  int scoreX = 0;
  int filledBoxes = 0;

  static var gameFontBlack = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var gameFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 14));
  static var playAgaingameFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 8));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TIC TAC TOE", style: gameFontWhite)),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player 0",
                          style: gameFontWhite.copyWith(
                            decoration: uTurn
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                        Text(
                          score0.toString(),
                          style: gameFontWhite,
                        ),
                        if (!uTurn) // Show a sign or outline bar for Player 0's turn
                          Container(
                            height: 5,
                            width: 30,
                            color: Colors.white, // Adjust color as needed
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player X",
                          style: gameFontWhite.copyWith(
                            decoration: !uTurn
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                        Text(
                          scoreX.toString(),
                          style: gameFontWhite,
                        ),
                        if (uTurn)
                          Container(
                            height: 3,
                            width: 30,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Center(
                        child: Text(displayZX[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 28)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (uTurn && displayZX[index] == "") {
        displayZX[index] = "X";
        filledBoxes++;
      } else if (!uTurn && displayZX[index] == "") {
        displayZX[index] = "0";
        filledBoxes++;
      }

      uTurn = !uTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    if (displayZX[0] == displayZX[1] &&
        displayZX[0] == displayZX[2] &&
        displayZX[0] != "") {
      showWinDialog(displayZX[0]);
    }
    if (displayZX[3] == displayZX[4] &&
        displayZX[3] == displayZX[5] &&
        displayZX[3] != "") {
      showWinDialog(displayZX[3]);
    }
    if (displayZX[6] == displayZX[7] &&
        displayZX[6] == displayZX[8] &&
        displayZX[6] != "") {
      showWinDialog(displayZX[6]);
    }
    if (displayZX[0] == displayZX[3] &&
        displayZX[0] == displayZX[6] &&
        displayZX[0] != "") {
      showWinDialog(displayZX[0]);
    }
    if (displayZX[1] == displayZX[4] &&
        displayZX[1] == displayZX[7] &&
        displayZX[1] != "") {
      showWinDialog(displayZX[1]);
    }
    if (displayZX[2] == displayZX[5] &&
        displayZX[2] == displayZX[8] &&
        displayZX[2] != "") {
      showWinDialog(displayZX[2]);
    }
    if (displayZX[0] == displayZX[4] &&
        displayZX[0] == displayZX[8] &&
        displayZX[0] != "") {
      showWinDialog(displayZX[0]);
    }
    if (displayZX[2] == displayZX[4] &&
        displayZX[2] == displayZX[6] &&
        displayZX[2] != "") {
      showWinDialog(displayZX[2]);
    } else if (filledBoxes == 9) {
      showDrawDialog();
    }
  }

  void showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
                child: Text(
              "Winner is $winner",
              style: gameFontWhite,
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Center(
                      child: Text("Play Again", style: playAgaingameFontWhite)))
            ],
          );
        });

    if (winner == "0") {
      score0++;
    } else if (winner == "X") {
      scoreX++;
    }
  }

  void showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
                child: Text(
              "Draw!",
              style: gameFontWhite,
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Center(
                      child: Text("Play Again", style: playAgaingameFontWhite)))
            ],
          );
        });
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayZX[i] = "";
      }
    });
    filledBoxes = 0;
  }
}
