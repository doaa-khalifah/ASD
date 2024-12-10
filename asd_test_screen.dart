// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ASDTestScreen extends StatefulWidget {
  const ASDTestScreen({Key? key}) : super(key: key);

  @override
  _ASDTestScreenState createState() => _ASDTestScreenState();
}

class _ASDTestScreenState extends State<ASDTestScreen>
    with WidgetsBindingObserver {
  int _currentQuestionIndex = 0;
  final List<String> _questions = [
    "Does your child avoid eye contact?",
    "Does your child have difficulty understanding social cues?",
    "Does your child engage in repetitive behaviors?",
    "Does your child show an unusual attachment to routines?",
    "Does your child have delayed speech or language skills?",
  ];

  final Map<int, String> _answers = {};

  void _nextQuestion(String answer) {
    setState(() {
      _answers[_currentQuestionIndex] = answer;
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResults();
      }
    });
  }

  void _showResults() {
    // For simplicity, let's just count the number of "Yes" answers
    int yesCount = _answers.values.where((answer) => answer == "Yes").length;

    String resultMessage;
    if (yesCount >= 3) {
      resultMessage =
          "Your child may be showing signs of ASD. We recommend consulting a specialist.";
    } else {
      resultMessage =
          "Your child is showing few signs of ASD. However, if you have concerns, please consult a specialist.";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("ASD Test Result"),
        content: Text(resultMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASD Screening Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _questions[_currentQuestionIndex],
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _nextQuestion("Yes"),
              child: const Text("Yes"),
            ),
            ElevatedButton(
              onPressed: () => _nextQuestion("No"),
              child: const Text("No"),
            ),
          ],
        ),
      ),
    );
  }
}
