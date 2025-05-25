import 'package:flutter/material.dart';
import 'package:real_sudoku/pages/board/sudoku_actions.dart';
import 'package:real_sudoku/pages/board/sudoku_board.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  String? selectedLevel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings;
    if (settings != null) {
      selectedLevel = settings.arguments as String?;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(size: 32),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.pause_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const Column(
        children: [
          SudokuBoard(),
          SudokuActions(),
        ],
      ),
    );
  }
}
