import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/widgets/app_bar.dart';

class Appinfo extends StatelessWidget {
  const Appinfo ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: Customapp(title: 'App info'),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            ''' 
            App Name: To-do 

Description: To-do is a powerful and user-friendly task management app that helps you stay organized and on top of your daily activities. With To-do, you can easily add, edit, and delete tasks, and efficiently manage your schedule by viewing tasks based on specific days and dates.

Key Features:

Task Creation: Quickly add new tasks with titles, descriptions, due dates, and priority levels. You can also categorize tasks into different lists for better organization.

Task Editing: Easily update task details, such as the title, description, due date, and priority. This feature allows you to adapt to changing priorities and requirements.

Task Deletion: Remove completed or unnecessary tasks with just a few taps. Keep your task list clutter-free by deleting what's no longer relevant.

Date-Based View: To-do allows you to view your tasks based on specific dates. Choose a date from the calendar, and the app will display all tasks scheduled for that day.

Day-Based View: Switch to a day-based view to get a comprehensive look at all your tasks for the selected day, helping you plan your day effectively.

Reminders: Set reminders for important tasks so you never miss a deadline. To-do will send you notifications to ensure you stay on track.

Priority Levels: Categorize tasks as high, medium, or low priority to focus on what matters most. To-do helps you prioritize your workload.

Search and Filters: Easily find tasks by using search functionality or applying filters to sort tasks by criteria such as priority, completion status, or list.

Sync Across Devices: To-do synchronizes your tasks across multiple devices, ensuring you have access to your to-do list anytime, anywhere.

User-Friendly Interface: To-do features an intuitive and clean design that makes task management a breeze. The user interface is easy to navigate, even for beginners.

Compatibility: To-do is available on both iOS and Android platforms, with web access for those who prefer to manage tasks from their computers.

With To-do, you can take control of your tasks and schedule, making it a valuable tool for personal productivity and project management. Stay organized, meet deadlines, and achieve your goals with ease.
            ''',

            style: TextStyle(fontSize: 16, color: gray),
          ),
        ),
      ),
    );
  }
}
