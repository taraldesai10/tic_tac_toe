import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/play_with_bot.dart';

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
