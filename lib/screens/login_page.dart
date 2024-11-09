import 'package:flutter/material.dart';
import 'package:makeen/screens/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل دخول'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Image.asset('assets/images/logo.png', width: 200),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مرحبا بكم',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16.0),
                    const TextField(
                      decoration:
                          InputDecoration(labelText: 'البريد الإلكتروني'),
                    ),
                    const SizedBox(height: 16.0),
                    const TextField(
                      decoration: InputDecoration(labelText: 'الرمز السري'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('تسجيل دخول')),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text('إنشاء حساب جديد'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
