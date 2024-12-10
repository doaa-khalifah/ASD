// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  final String userType;
  final String userId; // Add userId parameter

  const ScheduleScreen({Key? key, required this.userType, required this.userId})
      : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.userType} Schedule'),
      ),
      body: Center(
        child: Text('Schedule for user ID: ${widget.userId}'),
      ),
    );
  }
}
