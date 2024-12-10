// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Games extends StatelessWidget {
  final List<String> gameTitles = [
    'Memory Match',
    'Shape Sorter',
    'Color Hunt',
    'Number Puzzle',
    'Story Time'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(gameTitles[index]),
          onTap: () {
            // Add navigation logic here if needed
          },
        );
      },
    );
  }
}
