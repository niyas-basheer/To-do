import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '''1. Introduction
Welcome to our application. By accessing or using our app, you agree to be bound by these terms and conditions.

2. Use of the App
You may use the app only for lawful purposes and in accordance with these Terms and Conditions.

3. User Obligations
You agree to use the app responsibly and not to misuse any features or services.

4. Intellectual Property
All content and materials available on the app are the property of the app developer.

5. Limitation of Liability
We are not responsible for any damages that may arise from the use or inability to use the app.

6. Governing Law
These terms shall be governed by and construed in accordance with the laws of the jurisdiction in which we operate.

7. Changes to Terms
We reserve the right to modify these terms at any time. Any changes will be posted on this page.

8. Contact Us
If you have any questions about these Terms, please contact us through the app.''',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
