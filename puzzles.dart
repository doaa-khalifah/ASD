// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Puzzles extends StatelessWidget {
  final List<String> puzzleGameTitles = [
    'Jigsaw Puzzle',
    'Maze Runner',
    'Word Search',
    'Tangram',
    'Sudoku'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: puzzleGameTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(puzzleGameTitles[index]),
          onTap: () {
            // Add navigation logic here if needed
          },
        );
      },
    );
  }
}
