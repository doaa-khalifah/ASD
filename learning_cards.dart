// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LearningCards extends StatelessWidget {
  final List<String> learningCardTitles = [
    'Animal Sounds',
    'Colors and Shapes',
    'Numbers and Counting',
    'Alphabet Adventure',
    'Nature Explorers'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: learningCardTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(learningCardTitles[index]),
          onTap: () {
            // Add navigation logic here if needed
          },
        );
      },
    );
  }
}
