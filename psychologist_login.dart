import 'package:flutter/material.dart';
import 'psychologist_dashboard.dart';

class PsychologistLogin extends StatelessWidget {
  const PsychologistLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void authenticate() {
      if (emailController.text == "psychologist@example.com" &&
          passwordController.text == "psychologist123") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PsychologistDashboard(
              psychologistId: '',
            ),
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
        title: const Text('Psychologist Login'),
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
