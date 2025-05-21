import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
        actionsIconTheme: const IconThemeData(size: 32),
      ),
      body: Column(
        children: [
          const BoardGrid(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                label: const Icon(
                  Icons.undo,
                  size: 18,
                ),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Icon(
                  Icons.clear,
                  size: 18,
                ),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(9, (index) {
                return Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class BoardGrid extends StatefulWidget {
  const BoardGrid({super.key});

  @override
  State<BoardGrid> createState() => _BoardGridState();
}

class _BoardGridState extends State<BoardGrid> {
  late List<List<int>> _sudokuGrid;

  @override
  void initState() {
    super.initState();
    _sudokuGrid = List.generate(9, (_) => List.generate(9, (_) => 0));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.11,
        bottom: MediaQuery.of(context).size.height * 0.055,
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9, // 9x9 grid
              childAspectRatio: 1.0, // Ensure cells are square
            ),
            itemCount: 81, // Total number of cells (9 * 9)
            itemBuilder: (context, index) {
              final row = index ~/ 9; // Integer division to get row index
              final col = index % 9; // Modulo to get column index
              final cellValue = _sudokuGrid[row][col];

              // Determine if this is a cell in a thicker border
              bool isThickRight = (col + 1) % 3 == 0 && col != 8;
              bool isThickBottom = (row + 1) % 3 == 0 && row != 8;

              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: isThickRight ? Colors.black : Colors.blueGrey,
                      width: isThickRight ? 1.5 : 1.0,
                    ),
                    bottom: BorderSide(
                      color: isThickBottom ? Colors.black : Colors.blueGrey,
                      width: isThickBottom ? 1.5 : 1.0,
                    ),
                    left: const BorderSide(color: Colors.blueGrey, width: 0.5),
                    top: const BorderSide(color: Colors.blueGrey, width: 0.5),
                  ),
                ),
                alignment: Alignment.center,
                child: cellValue == 0
                    ? null // Display nothing for empty cells
                    : Text(
                        cellValue.toString(),
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
