import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  // Border state to keep track of moves
  final List<String> board = List.filled(9, "");
  // Current player(x or o)
  String currentPlayer = "X";
  // Variable to store the winner
  String winner = "";
  // Flag to indicate a tie
  bool isTie = false;
  // function to handle a player's move
  player(int index) {
    if (winner != '' || board[index] != "") {
      return; // If the game is already won or the cell is not empty do nothig
    }
    setState(
      () {
        board[index] =
            currentPlayer; // set the current cell to the current player's symbol
        currentPlayer = currentPlayer == "X"
            ? "O"
            : "X"; // switch to the one to another player
        checkForWinner();
      },
    );
  }

  // function to check for a winner or a tie
  checkForWinner() {
    List<List<int>> lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    // check each winning combination
    for (List<int> line in lines) {
      String player1 = board[line[0]];
      String player2 = board[line[1]];
      String player3 = board[line[2]];
      if (player1 == "" || player2 == "" || player3 == "") {
        continue; // If any cell in the combination is empty, skip theis combination
      }
      if (player1 == player2 && player2 == player3) {
        setState(() {
          winner =
              player1; // If all cells in the combination are the same, set the winner
        });
        return;
      }
    }
    // Check for a tie
    if (!board.contains("")) {
      setState(() {
        isTie = true; // if no cells are empty and there's no winner it's a tie
      });
    }
  }

  // function to reset the game state and play the new game
  resetGame() {
    setState(() {
      board.fillRange(0, 9, ''); // clear the board
      currentPlayer = 'X';
      winner = ''; // clear the winner
      isTie = false; // clear the tie flag
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Displaying the players
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: currentPlayer == "X"
                        ? Colors.amber
                        : Colors.transparent,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 55,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "BOT 1",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "X",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.08),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: currentPlayer == "O"
                        ? Colors.amber
                        : Colors.transparent,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 55,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "BOT 2",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "0",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.04),
          // Display the winner message
          if (winner != "")
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  winner,
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  " WON!",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          // Display tie message
          if (isTie)
            const Text(
              "It's a Tie!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          // for game board
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: 9,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    player(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Reset button
          if (winner != "" || isTie)
            ElevatedButton(
              onPressed: resetGame,
              child: const Text("Play Again"),
            ),
        ],
      ),
    );
  }
}
