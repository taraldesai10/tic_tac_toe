import 'dart:math';

import 'package:flutter/material.dart';

class Controller {
  static List value = List.generate(9, (index) => "");
  static List<RadialGradient> cardColor = List.generate(
    9,
    (index) => RadialGradient(
      tileMode: TileMode.clamp,
      colors: [
        Colors.deepPurple.shade200,
        Colors.deepPurple,
      ],
    ),
  );
  static bool xTurn = false;
  static int fillBox = 0;
  static int playerOCount = 0;
  static int playerXCount = 0;
  static int drawMatch = 0;
  static void swap(index, context) {
    if (xTurn && value[index] == "") {
      value[index] = "O";
      // elevation[index] = 20;
      cardColor[index] = RadialGradient(
        tileMode: TileMode.clamp,
        colors: [
          Colors.red.shade100,
          Colors.redAccent,
        ],
      );
      xTurn = !xTurn;
      fillBox += 1;
    } else if (!xTurn && value[index] == "") {
      value[index] = "X";
      // elevation[index] = 20;
      cardColor[index] = RadialGradient(
        tileMode: TileMode.clamp,
        colors: [
          Colors.white,
          Colors.lightGreen.shade400,
        ],
      );
      xTurn = !xTurn;
      fillBox += 1;
    }
    //after fill box auto clean
  }

  static void winner(context) {
    if (value[0] == value[1] && value[1] == value[2] && value[0] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[0] == value[1] &&
        value[1] == value[2] &&
        value[2] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[3] == value[4] &&
        value[4] == value[5] &&
        value[3] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[3] == value[4] &&
        value[4] == value[5] &&
        value[3] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[6] == value[7] &&
        value[7] == value[8] &&
        value[6] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[6] == value[7] &&
        value[7] == value[8] &&
        value[6] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[0] == value[4] &&
        value[4] == value[8] &&
        value[0] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[0] == value[4] &&
        value[4] == value[8] &&
        value[0] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[2] == value[4] &&
        value[4] == value[6] &&
        value[2] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[0] == value[4] &&
        value[4] == value[8] &&
        value[0] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[2] == value[5] &&
        value[5] == value[8] &&
        value[2] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[2] == value[5] &&
        value[5] == value[8] &&
        value[2] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[0] == value[3] &&
        value[3] == value[6] &&
        value[0] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[0] == value[3] &&
        value[3] == value[6] &&
        value[0] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[1] == value[4] &&
        value[4] == value[7] &&
        value[1] == "X") {
      winnerNumber(context);
      clearButtomn();
    } else if (value[1] == value[4] &&
        value[4] == value[7] &&
        value[1] == "O") {
      winnerNumber(context);
      clearButtomn();
    } else if (fillBox == 9) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Draw Match Play Again..."),
        ),
      );
      drawMatch += 1;
      clearButtomn();
    }
  }

  static void winnerNumber(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text((xTurn) ? "Player X is Winner" : "Player O is Winner")));
    if (xTurn) {
      playerXCount++;
      xTurn = !xTurn;
    } else {
      playerOCount++;
      xTurn = !xTurn;
    }
    clearButtomn();
  }

  static void clearButtomn() async {
    fillBox = 0;
    value = List.generate(9, (index) => "");
    cardColor = List.generate(
        9,
        (index) => RadialGradient(
              tileMode: TileMode.clamp,
              colors: [
                Colors.deepPurple.shade100,
                Colors.deepPurple,
              ],
            ));
  }
}
