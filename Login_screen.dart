import 'package:flutter/material.dart';

// Mock dashboards for different users
class ParentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parent Dashboard')),
      body: Center(child: const Text('Welcome to the Parent Dashboard!')),
    );
  }
}

class PsychologistDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Psychologist Dashboard')),
      body: Center(child: const Text('Welcome to the Psychologist Dashboard!')),
    );
  }
}

class ChildDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Child Dashboard')),
      body: Center(child: const Text('Welcome to the Child Dashboard!')),
    );
  }
}

// Login screen
class LoginScreen extends StatelessWidget {
  final String userType;

  const LoginScreen({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, Map<String, String>> userCredentials = {
      'parent@gmail.com': {'password': 'parent123', 'type': 'Parent'},
      'child@gmail.com': {'password': 'child123', 'type': 'Child'},
      'psychologist@gmail.com': {
        'password': 'psychologist123',
        'type': 'Psychologist'
      },
    };

    void login() {
      if (formKey.currentState!.validate()) {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();

        if (userCredentials.containsKey(email) &&
            userCredentials[email]!['password'] == password &&
            userCredentials[email]!['type'] == userType) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successful as $userType')),
          );

          // Navigate to the respective dashboard
          if (userType == 'Parent') {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ParentDashboard()));
          } else if (userType == 'Child') {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ChildDashboard()));
          } else if (userType == 'Psychologist') {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => PsychologistDashboard()));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email or password')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('$userType Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// User selection screen
class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select User Type')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen(userType: 'Parent')),
                );
              },
              child: const Text('Parent'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen(userType: 'Child')),
                );
              },
              child: const Text('Child'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen(userType: 'Psychologist')),
                );
              },
              child: const Text('Psychologist'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const UserSelectionScreen(),
  ));
}
