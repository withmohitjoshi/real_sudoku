import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  final int value;
  final int row;
  final int col;

  const SudokuCell({
    super.key,
    required this.value,
    required this.row,
    required this.col,
  });

  @override
  Widget build(BuildContext context) {
    final bool isThickRight = (col + 1) % 3 == 0 && col != 8;
    final bool isThickBottom = (row + 1) % 3 == 0 && row != 8;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: isThickRight ? Colors.black : Colors.grey.shade400,
            width: isThickRight ? 2.0 : 0.5,
          ),
          bottom: BorderSide(
            color: isThickBottom ? Colors.black : Colors.grey.shade400,
            width: isThickBottom ? 2.0 : 0.5,
          ),
          top: BorderSide(color: Colors.grey.shade400, width: 0.5),
          left: BorderSide(color: Colors.grey.shade400, width: 0.5),
        ),
      ),
      alignment: Alignment.center,
      child: value == 0
          ? null
          : Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
    );
  }
}
