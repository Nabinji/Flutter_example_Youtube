// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SnakeGamePage extends StatefulWidget {
  const SnakeGamePage({super.key});

  @override
  State<SnakeGamePage> createState() => _SnakeGamePageState();
}

enum Direction { up, down, left, right }

class _SnakeGamePageState extends State<SnakeGamePage> {
  int noOfRow = 38, noOfRcolumn = 21;
  List<int> borderList = [];
  List<int> snakePosition = [];
  int snakeHead = 0;
  int score = 0;
  late Direction direction;
  late int foodPosition;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    startGame();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void startGame() {
    setState(() {
      score = 0; // Reset score in every new game
      makeBorder();
      generateFood();
      direction = Direction.right; // Set the initial direction of the snake
      snakePosition = [50, 49, 48]; // Set the initial position of the snake
      snakeHead = snakePosition.first;
    });
// Set up a periodic timer to update the snake's position
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      updateSnake();
      if (checkCollision()) {
        timer.cancel();
        showGameOverDialog();
      }
    });
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // dialog box for restart the game and show final score
        return AlertDialog(
          title: const Text("Game Over"),
          content: Text(
            "Your Final Score is: $score",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                startGame();
              },
              child: const Text("Restart"),
            ),
          ],
        );
      },
    );
  }

  // Check if the snake collides with the border or itself
  bool checkCollision() {
    if (borderList.contains(snakeHead)) return true;
    if (snakePosition.sublist(1).contains(snakeHead)) return true;
    return false;
  }

  void generateFood() {
    // Generate a random position for the food
    foodPosition = Random().nextInt(noOfRow * noOfRcolumn);
    // Ensure the food is not placed on the border or the snake
    if (borderList.contains(foodPosition) ||
        snakePosition.contains(foodPosition)) {
      generateFood();
    }
  }

  // Update the snake's head position based on the current direction
  void updateSnake() {
    setState(() {
      switch (direction) {
        case Direction.up:
          snakePosition.insert(0, snakeHead - noOfRcolumn);
          break;
        case Direction.down:
          snakePosition.insert(0, snakeHead + noOfRcolumn);
          break;
        case Direction.right:
          snakePosition.insert(0, snakeHead + 1);
          break;
        case Direction.left:
          snakePosition.insert(0, snakeHead - 1);
          break;
      }
    });
// Check if the snake has eaten the food
    if (snakeHead == foodPosition) {
      score++; // Increase the score
      generateFood(); // Generate a new food position
    } else {
      snakePosition.removeLast();
    }

    snakeHead = snakePosition.first;
  }

  // Handle keyboard input to change the snake's direction
  void handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp: // Arrow Up
          if (direction != Direction.down) direction = Direction.up;
          break;
        case LogicalKeyboardKey.arrowDown: // Arrow Down
          if (direction != Direction.up) direction = Direction.down;
          break;
        case LogicalKeyboardKey.arrowLeft: // Arrow Left
          if (direction != Direction.right) direction = Direction.left;
          break;
        case LogicalKeyboardKey.arrowRight: // Arrow Right
          if (direction != Direction.left) direction = Direction.right;
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: RawKeyboardListener(
          focusNode: focusNode,
          onKey: handleKey,
          autofocus: true,
          child: Column(
            children: [
              Text(
                "Score: $score",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Expanded(child: snakeGround()),
            ],
          ),
        ),
      ),
    );
  }

  Widget snakeGround() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: noOfRcolumn),
      itemBuilder: (context, index) {
        return Container(
          color: fillBoxColor(index),
          margin: const EdgeInsets.only(right: 1, bottom: 1),
        );
      },
      itemCount: noOfRow * noOfRcolumn,
    );
  }

  Color fillBoxColor(int index) {
    if (borderList.contains(index)) {
      //out boder color
      return Colors.blue;
    } else {
      if (snakePosition.contains(index)) {
        if (snakeHead == index) {
          // snake head color
          return Colors.green;
        } else {
          // snake body color
          return Colors.black45;
        }
      } else {
        if (index == foodPosition) {
          // snake food color
          return Colors.green;
        }
      }
    }
    // ground grid color
    return Colors.white60;
  }

  void makeBorder() {
    borderList.clear(); // Ensure borderList is cleared before adding borders
    // Add the top border cells
    for (int i = 0; i < noOfRcolumn; i++) {
      borderList.add(i);
    }
    // Add the left border cells
    for (int i = 0; i < noOfRow * noOfRcolumn; i += noOfRcolumn) {
      borderList.add(i);
    }
    // Add the right border cells
    for (int i = noOfRcolumn - 1; i < noOfRow * noOfRcolumn; i += noOfRcolumn) {
      borderList.add(i);
    }
    // Add the bottom border cells
    for (int i = (noOfRow * noOfRcolumn) - noOfRcolumn;
        i < noOfRow * noOfRcolumn;
        i++) {
      borderList.add(i);
    }
  }
}
