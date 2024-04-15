import 'package:flutter/material.dart';
import 'package:tic_tac_toe/selection_screen.dart';
import 'package:tic_tac_toe/play_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(home: HomePage());
  }
}
