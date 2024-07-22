import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  // Board state to keep track of moves
  final List<String> _board = List.filled(9, '');
  // Current player ('X' or 'O')
  String _currentPlayer = 'X';
  // Variable to store the winner
  String _winner = '';
  // Flag to indicate a tie
  bool _isTie = false;

  // Function to handle a player's move
  _play(int index) {
    if (_winner != '' || _board[index] != '') {
      return; // If the game is already won or the cell is not empty, do nothing
    }

    setState(() {
      _board[index] =
          _currentPlayer; // Set the current cell to the current player's symbol
      _currentPlayer =
          _currentPlayer == 'X' ? 'O' : 'X'; // Switch to the other player
      _checkForWinner(); // Check if there's a winner or a tie
    });
  }

  // Function to check for a winner or a tie
  _checkForWinner() {
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

    // Check each winning combination
    for (List<int> line in lines) {
      String player1 = _board[line[0]];
      String player2 = _board[line[1]];
      String player3 = _board[line[2]];
      if (player1 == '' || player2 == '' || player3 == '') {
        continue; // If any cell in the combination is empty, skip this combination
      }
      if (player1 == player2 && player2 == player3) {
        setState(() {
          _winner =
              player1; // If all cells in the combination are the same, set the winner
        });
        return;
      }
    }

    // Check for a tie
    if (!_board.contains('')) {
      setState(() {
        _isTie =
            true; // If no cells are empty and there's no winner, it's a tie
      });
    }
  }

  // Function to reset the game state and pay the new game
  _resetGame() {
    setState(() {
      _board.fillRange(0, 9, ''); // Clear the board
      _currentPlayer = 'X'; // Reset to player 'X'
      _winner = ''; // Clear the winner
      _isTie = false; // Clear the tie flag
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          // Displaying the players
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Colors.black38, blurRadius: 3)
                  ],
                  border: Border.all(
                    color: _currentPlayer == "X"
                        ? Colors.amber
                        : Colors.transparent,
                  ),
                  // color: const Color(0xff332167),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'BOT 1',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'X',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.075),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Colors.black38, blurRadius: 3)
                  ],
                  border: Border.all(
                    color: _currentPlayer == "O"
                        ? Colors.amber
                        : Colors.transparent,
                  ),
                  // color: const Color(0xff332167),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'BOT 2',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'O',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          // Display winner message
          if (_winner != "")
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _winner,
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  ' WON!',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          // Display tie message
          if (_isTie)
            const Text(
              'It\'s a Tie!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),

          // Game board
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _play(index); // Handle player move
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        _board[index],
                        style: const TextStyle(
                          fontSize: 48,
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
          if (_winner != "" || _isTie)
            ElevatedButton(
              onPressed: _resetGame, // Reset the game
              child: const Text('Play Again'),
            ),
        ],
      ),
    );
  }
}
