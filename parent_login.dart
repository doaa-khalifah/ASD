import 'package:flutter/material.dart';
import 'package:was_autism_spectrum_disorder/parent_dashboard.dart';

class ParentLogin extends StatelessWidget {
  const ParentLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void authenticate() {
      if (emailController.text == "parent@example.com" &&
          passwordController.text == "parent123") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ParentDashboard(
                  parentId: AutofillHints.email,
                  chatRoomId: AutofillHints.familyName)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Login'),
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
