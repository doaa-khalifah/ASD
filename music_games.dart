// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MusicGames extends StatelessWidget {
  final List<String> musicGameTitles = [
    'Rhythm Tapper',
    'Melody Match',
    'Instrument Explorer',
    'Song Builder',
    'Music Quiz'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: musicGameTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(musicGameTitles[index]),
          onTap: () {
            // Add navigation logic here if needed
          },
        );
      },
    );
  }
}
