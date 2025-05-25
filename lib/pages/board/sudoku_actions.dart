import 'package:flutter/material.dart';

class SudokuActions extends StatefulWidget {
  const SudokuActions({super.key});

  @override
  State<SudokuActions> createState() => _SudokuActionsState();
}

class _SudokuActionsState extends State<SudokuActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                backgroundColor: Theme.of(context).colorScheme.primary,
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
                backgroundColor: Theme.of(context).colorScheme.primary,
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
                    backgroundColor: Theme.of(context).colorScheme.primary,
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
    );
  }
}
