import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'package:to_do_app/taskmanager/taskdisplay.dart';
import '../calander.dart/calanderlogic.dart' as myapp;

class CalendarPageWidgets {
  

 static Widget buildHorizontalListView(DateTime selectedDate, Function(DateTime) onDaySelected) {
  return SizedBox(
    height: 130,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: myapp.DateUtils.daysInMonth(selectedDate).length,
      itemBuilder: (context, index) {
        final day = myapp.DateUtils.daysInMonth(selectedDate)[index];

        return InkWell(
          onTap: () {
            onDaySelected(day);
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: selectedDate.isAtSameMomentAs(day) ? secondaryColor : notselectedcolr,
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    myapp.DateUtils.formatDayWithDayName(day), 
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackcolor,
                      fontFamily: 'DelaGothicOne',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}








static Widget buildVerticalListView(List<Task> tasks, DateTime selectedDate, BuildContext context) {
  final filteredTasks = tasks.where((task) {
    // Add your date filtering logic here
    if (task.startDate != null && task.endDate != null) {
      final taskStartDate = DateTime.tryParse(task.startDate!);
      final taskEndDate = DateTime.tryParse(task.endDate!);

      // Check if selectedDate is on or after taskStartDate and on or before taskEndDate
      return selectedDate.isAtSameMomentAs(taskStartDate!) || 
             selectedDate.isAtSameMomentAs(taskEndDate!) ||
             (selectedDate.isAfter(taskStartDate) && selectedDate.isBefore(taskEndDate));
    }
    return false;
  }).toList();

  if (filteredTasks.isEmpty) {
    return const Center(
      child: Text('No items found'),
    );
  }

  return Expanded(
    child: Container(
      height: 300,
      decoration: const BoxDecoration(),
      child: ListView.separated(
        itemCount: filteredTasks.length,
        separatorBuilder: (context, index) => const Divider(
          color: white,
          thickness: 10,
        ),
        itemBuilder: (context, index) {
          final task = filteredTasks[index];
          final int pendingTaskCount = task.subtasks
              .where((subtask) => !subtask.isCompleted)
              .length;
          final String startingDate = task.startDate != null
              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(task.startDate!))
              : "Not specified";

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailPage(taskId: tasks.indexOf(task)), // Use the task index
                ),
              );
            },
            child: Container(
              width: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: notselectedcolr,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.heading,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: blackcolor,
                                fontFamily: 'DelaGothicOne',
                              ),
                            ),
                            Text(
                              'Starting Date: $startingDate',
                              style: const TextStyle(
                                fontSize: 14,
                                color: blackcolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '$pendingTaskCount',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: blackcolor,
                            ),
                          ),
                          const Text(
                            'Pending',
                            style: TextStyle(
                              fontSize: 14,
                              color: blackcolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}


}
