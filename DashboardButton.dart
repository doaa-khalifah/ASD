import 'package:flutter/material.dart';

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parent Dashboard')),
      body: const Center(child: Text('Welcome Parent')),
    );
  }
}

class ChildDashboard extends StatelessWidget {
  const ChildDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Child Dashboard')),
      body: const Center(child: Text('Welcome Child')),
    );
  }
}

class PsychologistDashboard extends StatelessWidget {
  const PsychologistDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Psychologist Dashboard')),
      body: const Center(child: Text('Welcome Psychologist')),
    );
  }
}
