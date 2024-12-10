import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

Future<void> loadSampleData() async {
  final String response =
      await rootBundle.loadString('assets/sample_data.json');
  final Map<String, dynamic> data = json.decode(response);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Upload chat rooms
  data['chatRooms'].forEach((roomId, roomData) async {
    await firestore.collection('chatRooms').doc(roomId).set({
      'participants': roomData['participants'],
      'lastMessage': roomData['lastMessage'],
      'lastMessageTime': roomData['lastMessageTime']
    });

    roomData['messages'].forEach((msgId, msgData) async {
      await firestore
          .collection('chatRooms')
          .doc(roomId)
          .collection('messages')
          .doc(msgId)
          .set(msgData);
    });
  });

  // Upload ASD test questions
  data['asdTestQuestions'].forEach((questionId, questionData) async {
    await firestore
        .collection('asdTestQuestions')
        .doc(questionId)
        .set(questionData);
  });

  // Upload child development data
  data['childDevelopment'].forEach((childId, childData) async {
    await firestore.collection('childDevelopment').doc(childId).set(childData);
  });

  // Upload sessions
  data['sessions'].forEach((sessionId, sessionData) async {
    await firestore.collection('sessions').doc(sessionId).set(sessionData);
  });
}
