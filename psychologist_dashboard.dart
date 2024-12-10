// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PsychologistDashboard extends StatefulWidget {
  const PsychologistDashboard({Key? key, required String psychologistId})
      : super(key: key);

  @override
  _PsychologistDashboardState createState() => _PsychologistDashboardState();
}

class _PsychologistDashboardState extends State<PsychologistDashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychologist Dashboard'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('sessions')
                  .where('psychologistId', isEqualTo: _auth.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var session = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(
                          'Session with ${session['parentName']} on ${session['day']} at ${session['time']}'),
                      subtitle: Text('Status: ${session['status']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editSession(session),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => _addNewSession(),
            child: const Text('Add New Session'),
          ),
        ],
      ),
    );
  }

  void _addNewSession() {
    showDialog(
      context: context,
      builder: (context) {
        String parentName = '';
        String day = '';
        String time = '';
        return AlertDialog(
          title: const Text('Add New Session'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Parent Name'),
                onChanged: (value) => parentName = value,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Day'),
                onChanged: (value) => day = value,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Time'),
                onChanged: (value) => time = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (parentName.isNotEmpty &&
                    day.isNotEmpty &&
                    time.isNotEmpty) {
                  _firestore.collection('sessions').add({
                    'psychologistId': _auth.currentUser?.uid,
                    'parentName': parentName,
                    'day': day,
                    'time': time,
                    'status': 'Scheduled',
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editSession(DocumentSnapshot session) {
    showDialog(
      context: context,
      builder: (context) {
        String parentName = session['parentName'];
        String day = session['day'];
        String time = session['time'];
        String status = session['status'];
        return AlertDialog(
          title: const Text('Edit Session'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Parent Name'),
                onChanged: (value) => parentName = value,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Day'),
                onChanged: (value) => day = value,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Time'),
                onChanged: (value) => time = value,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Status'),
                onChanged: (value) => status = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (parentName.isNotEmpty &&
                    day.isNotEmpty &&
                    time.isNotEmpty &&
                    status.isNotEmpty) {
                  _firestore.collection('sessions').doc(session.id).update({
                    'parentName': parentName,
                    'day': day,
                    'time': time,
                    'status': status,
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
