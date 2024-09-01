import 'package:flutter/material.dart';


class TaskHeading extends StatelessWidget {
  final String title;
  const TaskHeading({
    super.key, required this.title, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall
      ),
    ),
          ],
        );
  }
}
