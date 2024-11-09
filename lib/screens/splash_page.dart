
import 'package:flutter/material.dart';
import 'package:makeen/screens/signup_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/logo.png', height: 150),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'تمكن نحو جيل يواكب تطلعات وطنه',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                foregroundColor: Colors.deepPurple.shade900,
                textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // Navigate to login page
              },
              child: const Text('تسجيل دخول'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                  (route) => false,
                );
              },
              child: const Text('إنشاء حساب جديد'),
            ),
          ],
        ),
      ),
    );
  }
}
