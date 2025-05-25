import 'package:flutter/material.dart';
import 'package:real_sudoku/pages/board/sudoku_actions.dart';
import 'package:real_sudoku/pages/board/sudoku_board.dart';
import 'package:real_sudoku/utils/make_sudoku_game.dart';

class Board extends StatefulWidget {
  final String? selectedLevel;
  const Board({super.key, required this.selectedLevel});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  late List<List<int>> _sudokuGrid;

  @override
  void initState() {
    super.initState();
    _sudokuGrid = makeSudokuGame(widget.selectedLevel);
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
      body: Column(
        children: [
          SudokuBoard(
            sudokuGrid: _sudokuGrid,
          ),
          const SudokuActions(),
        ],
      ),
    );
  }
}
