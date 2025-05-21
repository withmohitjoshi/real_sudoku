import 'package:flutter/material.dart';
import 'package:sudoku/pages/board.dart';
import 'package:sudoku/pages/signin.dart';
import 'package:sudoku/pages/tabs/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const RootPage(),
        '/signin': (_) => const Signin(),
        '/board': (_) => const Board(),
      },
    );
  }
}
