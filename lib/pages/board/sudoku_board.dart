import 'package:flutter/material.dart';
import 'package:real_sudoku/pages/board/sudoku_cell.dart';

class SudokuBoard extends StatefulWidget {
  const SudokuBoard({super.key});

  @override
  State<SudokuBoard> createState() => _SudokuBoardState();
}

class _SudokuBoardState extends State<SudokuBoard> {
  late List<List<int>> _sudokuGrid;

  @override
  void initState() {
    super.initState();
    _sudokuGrid = List.generate(9, (_) => List.generate(9, (_) => 0));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.06,
        horizontal: 8.0,
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9,
              childAspectRatio: 1.0,
            ),
            itemCount: 81,
            itemBuilder: (context, index) {
              final row = index ~/ 9;
              final col = index % 9;
              return SudokuCell(
                value: _sudokuGrid[row][col],
                row: row,
                col: col,
              );
            },
          ),
        ),
      ),
    );
  }
}
