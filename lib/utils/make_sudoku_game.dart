import 'dart:math';

/// Generates a completely solved 9x9 Sudoku grid using a backtracking algorithm.
/// The generated grid will be a valid Sudoku solution.
///
/// Returns a 9x9 2D list of integers representing a solved Sudoku grid.
List<List<int>> generateSolvedSudoku() {
  // Initialize a 9x9 grid with zeros (empty cells)
  final List<List<int>> board =
      List.generate(9, (_) => List.generate(9, (_) => 0));

  // Start solving the empty board
  _solveSudoku(board);

  return board;
}

/// Checks if a number can be placed in a given cell (row, col)
/// without violating Sudoku rules.
///
/// [currentBoard]: The current state of the Sudoku board.
/// [row]: The row index (0-8).
/// [col]: The column index (0-8).
/// [num]: The number to check (1-9).
/// Returns true if the number is valid, false otherwise.
bool _isValid(List<List<int>> currentBoard, int row, int col, int num) {
  // Check row
  for (int x = 0; x < 9; x++) {
    if (currentBoard[row][x] == num) {
      return false;
    }
  }

  // Check column
  for (int x = 0; x < 9; x++) {
    if (currentBoard[x][col] == num) {
      return false;
    }
  }

  // Check 3x3 subgrid
  final int startRow = (row ~/ 3) * 3;
  final int startCol = (col ~/ 3) * 3;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (currentBoard[startRow + i][startCol + j] == num) {
        return false;
      }
    }
  }

  return true;
}

/// The main backtracking function to fill the Sudoku board.
/// It attempts to place numbers in cells, and if a path leads to a dead end,
/// it backtracks and tries a different number.
///
/// [currentBoard]: The current state of the Sudoku board.
/// Returns true if the board is successfully filled, false otherwise.
bool _solveSudoku(List<List<int>> currentBoard) {
  int row = -1;
  int col = -1;
  bool isEmpty = true;

  // Find the next empty cell (represented by 0)
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (currentBoard[i][j] == 0) {
        row = i;
        col = j;
        isEmpty = false;
        break; // Found an empty cell, break inner loop
      }
    }
    if (!isEmpty) {
      break; // Found an empty cell, break outer loop
    }
  }

  // If no empty cell is found, the board is solved
  if (isEmpty) {
    return true;
  }

  // Try numbers from 1 to 9
  // Shuffle the numbers to generate different valid solutions each time
  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]..shuffle(Random());

  for (final int num in numbers) {
    if (_isValid(currentBoard, row, col, num)) {
      currentBoard[row][col] = num; // Place the number

      // Recursively try to solve the rest of the board
      if (_solveSudoku(currentBoard)) {
        return true; // If successful, propagate true
      } else {
        currentBoard[row][col] =
            0; // Backtrack: reset the cell if current path fails
      }
    }
  }

  return false; // No number worked for this cell, trigger backtracking
}

/// Generates a Sudoku game grid by removing numbers from a solved grid.
/// The difficulty level determines how many numbers are removed.
///
/// [level]: The difficulty level ('easy', 'medium', 'hard'). Defaults to 'easy'.
/// Returns a 9x9 2D list of integers representing a Sudoku puzzle.
///
/// Note: This simplified version does not guarantee a unique solution
/// after removing numbers. For a robust game, you would need to
/// implement a solver to verify uniqueness after each removal.
List<List<int>> makeSudokuGame([String? level = 'easy']) {
  // 1. Generate a completely solved Sudoku grid
  final List<List<int>> solvedGrid = generateSolvedSudoku();

  // 2. Create a deep copy of the solved grid to modify
  final List<List<int>> gameGrid =
      solvedGrid.map((row) => List<int>.from(row)).toList();

  // 3. Determine the number of cells to remove based on difficulty level
  int cellsToRemove;
  switch (level?.toLowerCase()) {
    case 'medium':
      cellsToRemove = 50; // Roughly 50 cells removed for medium
      break;
    case 'hard':
      cellsToRemove = 55; // Roughly 55 cells removed for hard
      break;
    case 'easy':
    default:
      cellsToRemove = 45; // Roughly 45 cells removed for easy
      break;
  }

  final Random random = Random();
  int removedCount = 0;

  // 4. Randomly remove numbers until the target count is reached
  while (removedCount < cellsToRemove) {
    final int row = random.nextInt(9);
    final int col = random.nextInt(9);

    if (gameGrid[row][col] != 0) {
      gameGrid[row][col] = 0; // Set cell to empty
      removedCount++;
    }
  }

  return gameGrid;
}
