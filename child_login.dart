import 'package:flutter/material.dart';

import 'child_dashboard.dart';

class ChildLogin extends StatelessWidget {
  const ChildLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void authenticate() {
      if (emailController.text == "child@example.com" &&
          passwordController.text == "child123") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChildDashboard(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: authenticate,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
