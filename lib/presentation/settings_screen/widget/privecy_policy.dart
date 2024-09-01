import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '''1. Introduction
Your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your information.

2. Information We Collect
We may collect information that you provide directly to us when using our app.

3. How We Use Your Information
We use the information we collect to provide, maintain, and improve our services.

4. Information Sharing
We do not share your personal information with third parties except as required by law.

5. Data Security
We take reasonable measures to protect your information from unauthorized access or disclosure.

6. Changes to This Policy
We may update our Privacy Policy from time to time. Any changes will be posted on this page.

7. Contact Us
If you have any questions about this Privacy Policy, please contact us through the app.''',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
