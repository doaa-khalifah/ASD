import 'package:flutter/material.dart';

class ChildDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to the Child Dashboard!'),
      ),
    );
  }
}
