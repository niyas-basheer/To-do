import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/widgets/bottamnavbar.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'package:to_do_app/graph/graph.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  int currentIndex = 1;
  int graph = 0;
  List<ChartData> chartData = [
    ChartData('Completed', 0, color: gray),
    ChartData('Pending', 0, color: secondaryColor),
  ];

  void onTap(index) {
    setState(() {
      currentIndex = index;
      updateGraphData();
    });
  }

  void onTapgraph(int timeFrameIndex) {
    setState(() {
      graph = timeFrameIndex;
      updateGraphData();
    });
  }

    @override
  void initState() {
    super.initState();
   
    updateGraphData();
  }

  void updateGraphData() {
    final taskBox = Hive.box<Task>('tasks');
    final List<Task> tasks = taskBox.values.toList();
    int completedTaskCount = 0;
    int pendingTaskCount = 0;

    final DateTime now = DateTime.now();

    if (graph == 0) {
      // "Today" is selected
      final DateTime today = DateTime(now.year, now.month, now.day);
      for (final task in tasks) {
        if (task.startDate != null && task.endDate != null) {
          final DateTime taskStartDate = DateTime.parse(task.startDate!);
          final DateTime taskEndDate = DateTime.parse(task.endDate!);
          if (taskStartDate.isAtSameMomentAs(today) ||
              taskEndDate.isAtSameMomentAs(today) ||
              (today.isAfter(taskStartDate) && today.isBefore(taskEndDate))) {
            if (task.getCompletedSubtaskCount() == task.subtasks.length) {
              completedTaskCount++;
            } else {
              pendingTaskCount++;
            }
          }
        }
      }
    } else if (graph == 1) {
      // "This Week" is selected
      final DateTime startOfWeek =
          now.subtract(Duration(days: now.weekday - 1));
      for (final task in tasks) {
        if (task.startDate != null && task.endDate != null) {
          final DateTime taskStartDate = DateTime.parse(task.startDate!);
          final DateTime taskEndDate = DateTime.parse(task.endDate!);
          if (taskStartDate.isAtSameMomentAs(startOfWeek) ||
              taskEndDate.isAtSameMomentAs(startOfWeek) ||
              (startOfWeek.isBefore(taskEndDate))) {
            if (task.getCompletedSubtaskCount() == task.subtasks.length) {
              completedTaskCount++;
            } else {
              pendingTaskCount++;
            }
          }
        }
      }
    } else if (graph == 2) {
      // "This Month" is selected
      final DateTime startOfMonth = DateTime(now.year, now.month, 1);
      for (final task in tasks) {
        if (task.startDate != null && task.endDate != null) {
          final DateTime taskStartDate = DateTime.parse(task.startDate!);
          final DateTime taskEndDate = DateTime.parse(task.endDate!);
          if (taskStartDate.isAtSameMomentAs(startOfMonth) ||
              taskEndDate.isAtSameMomentAs(startOfMonth) ||
              (startOfMonth.isBefore(taskEndDate))) {
            if (task.getCompletedSubtaskCount() == task.subtasks.length) {
              completedTaskCount++;
            } else {
              pendingTaskCount++;
            }
          }
        }
      }
    }

    setState(() {
      chartData[0].y = completedTaskCount.toDouble();
      chartData[1].y = pendingTaskCount.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
      automaticallyImplyLeading: false,
        title: const Text(
          "Graph",
          style: TextStyle(
            fontSize: 15,
            color: blackcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        children: [
          Column(
            children: [
              Align(
                child: Container(
                  width: 350,
                  height: 400,
                  decoration: BoxDecoration(
                    color: notselectedcolr,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      TaskPieChart(chartData: chartData),
                      // Legend for the chart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLegendItem(gray, 'Completed'),
                          _buildLegendItem(secondaryColor, 'Pending'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  buildContainerWithText("Today", 0),
                  const SizedBox(height: 20),
                  buildContainerWithText("This Week", 1),
                  const SizedBox(height: 20),
                  buildContainerWithText("This Month", 2),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }

  Widget buildContainerWithText(String text, int timeFrameIndex) {
    return Align(
      child: GestureDetector(
        onTap: () {
          onTapgraph(timeFrameIndex);
        },
        child: Container(
          width: 350,
          height: 60,
          decoration: BoxDecoration(
            color: graph == timeFrameIndex ? secondaryColor : notselectedcolr,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: graph == timeFrameIndex ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14, 
            color: Colors.white),
          ),
        ],
      ),
    );
  }
}
