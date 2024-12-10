import 'package:flutter/material.dart';

import 'asd_test_screen.dart';
import 'schedule_screen.dart';

class ParentDashboard extends StatelessWidget {
  final String parentId; // Assuming each parent has a unique ID
  final String chatRoomId; // Adding chatRoomId parameter

  const ParentDashboard(
      {Key? key, required this.parentId, required this.chatRoomId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleScreen(
                      userType: 'Parent',
                      userId: parentId,
                    ),
                  ),
                );
              },
              child: const Text('View Schedule'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ASDTestScreen(), // Replace with your ASD test screen
                  ),
                );
              },
              child: const Text('Take ASD Test'),
            ),
          ],
        ),
      ),
    );
  }
}
