import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About This App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '''This is a task management application designed to help you stay organized and productive. The app allows you to create, manage, and track your tasks, and provides insights through a dashboard. 

Features include:
- Adding and managing tasks
- Setting reminders and notifications
- Viewing task completion statistics

Our mission is to provide a simple and effective tool to help you manage your daily tasks and achieve your goals.

Developed by: [Your Name or Company]
Version: 1.0.0

Thank you for using our app!''',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
