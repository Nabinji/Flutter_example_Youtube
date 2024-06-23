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
  int noOfRow = 38, noOfColumn = 21;
  List<int> borderList = [];
  List<int> snakePosition = [];
  int snakeHeade = 0;
  int score = 0;
  late int foodPosition;
  late FocusNode focusNode;
  late Direction direction;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    startGame();
  }

  void despose() {
    focusNode.dispose();
    super.initState();
  }

  void startGame() {
    setState(() {
      score = 0; // reset score in every new game
      makeBorder();
      generateFood();
      direction = Direction.right; // set the initial direction of the snake
      snakePosition = [50, 49, 48]; // set he initial position of the snake
      snakeHeade = snakePosition.first;
    });
    // set up a periodic time to update the snake's posttion
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      updateSnake();
      if (checkCollision()) {
        timer.cancel();
        showDialogBox();
      }
    });
  }

  void showDialogBox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Game Over"),
            content: Text(
              "Your Final Score is: $score",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    startGame();
                  },
                  child: const Text(
                    "Restart",
                  ))
            ],
          );
        });
  }

  // check if the snake collides with the border or itself
  bool checkCollision() {
    if (borderList.contains(snakeHeade)) return true;
    if (snakePosition.sublist(1).contains(snakeHeade)) return true;
    return false;
  }

  void generateFood() {
    // fenerate a random postion of the food
    foodPosition = Random().nextInt(noOfRow * noOfColumn);
    // ensure the food is not placed on the border or the snake itself
    if (borderList.contains(foodPosition) ||
        snakePosition.contains(foodPosition)) {
      generateFood();
    }
  }

  // UPDATE THE SNAKE'S HEAD POSITION BASED ON THE CURRENT DIRECTION
  void updateSnake() {
    setState(() {
      switch (direction) {
        case Direction.up:
          snakePosition.insert(0, snakeHeade - noOfColumn);
          break;
        case Direction.down:
          snakePosition.insert(0, snakeHeade + noOfColumn);
          break;
        case Direction.right:
          snakePosition.insert(0, snakeHeade + 1);
          break;
        case Direction.left:
          snakePosition.insert(0, snakeHeade - 1);
          break;
      }
    });
    // check if the snake has eaten the food
    if (snakeHeade == foodPosition) {
      score++; // increase the score
      generateFood(); // generate a new food position
    } else {
      snakePosition.removeLast();
    }
    snakeHeade = snakePosition.first;
  }

// it handle keyboard input to change the snake's direction
  void handledKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp: // Arrow up
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
          onKey: handledKey,
          autofocus: true,
          child: Column(
            children: [
              Text(
                "Score:$score",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: groundForSnake(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget groundForSnake() {
    return GridView.builder(
      itemCount: noOfRow * noOfColumn,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: noOfColumn,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: boxFillColor(index),
          margin: const EdgeInsets.only(right: 1, bottom: 1),
        );
      },
    );
  }

// now we continue to code this error is solved doring next step
  Color boxFillColor(int index) {
    if (borderList.contains(index)) {
      // outer border color
      return Colors.blue;
    } else {
      if (snakePosition.contains(index)) {
        if (snakeHeade == index) {
          // snake head color
          return Colors.green;
        } else {
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

  // outer border of ground
  void makeBorder() {
    borderList.clear(); // ensure borderList is cleared before adding bordrs
    // add the top border cells
    for (int i = 0; i < noOfColumn; i++) {
      borderList.add(i);
    }
    // add the left border cells
    for (int i = 0; i < noOfRow * noOfColumn; i += noOfColumn) {
      borderList.add(i);
    }
    // add the right border cells
    for (int i = noOfColumn - 1; i < noOfRow * noOfColumn; i += noOfColumn) {
      borderList.add(i);
    }
    // add the bottom border cells
    for (int i = (noOfRow * noOfColumn) - noOfColumn;
        i < noOfRow * noOfColumn;
        i++) {
      borderList.add(i);
    }
  }
}
