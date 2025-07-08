import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  void _login() async {
  if (_email.text.isEmpty || _password.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in both fields')),
    );
    return;
  }

  setState(() {
    isLoading = true;
  });

  final authService = AuthService();
  bool success = await authService.login(_email.text, _password.text);

  setState(() {
    isLoading = false;
  });

  if (success) {
    Navigator.pushReplacementNamed(context, '/weather');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login failed. Use valid dummy credentials.')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Login', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
