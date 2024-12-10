// lib/services/child_development_tracker_screen.dart

// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChildDevelopmentTrackerScreen extends StatefulWidget {
  final String childId;

  const ChildDevelopmentTrackerScreen({Key? key, required this.childId})
      : super(key: key);

  @override
  _ChildDevelopmentTrackerScreenState createState() =>
      _ChildDevelopmentTrackerScreenState();
}

class _ChildDevelopmentTrackerScreenState
    extends State<ChildDevelopmentTrackerScreen> {
  late CollectionReference _developmentCollection;

  @override
  void initState() {
    super.initState();

    // Make sure childId is properly used here
    if (widget.childId.isNotEmpty) {
      _developmentCollection = FirebaseFirestore.instance
          .collection('childDevelopment')
          .doc(widget.childId)
          .collection('progress');
    } else {
      throw ArgumentError("childId cannot be empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Development Tracker'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _developmentCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text('No development data found for this child.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var progressData = snapshot.data!.docs[index];
              return ListTile(
                title: Text(progressData['description'] ?? 'No description'),
                subtitle: Text('Date: ${progressData['date'] ?? 'Unknown'}'),
              );
            },
          );
        },
      ),
    );
  }
}
