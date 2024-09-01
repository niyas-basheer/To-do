import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';

class TaskCompletionGraph extends StatelessWidget {
  final List<Task> tasks;

  const TaskCompletionGraph({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 22),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: _getSpots(tasks),
            isCurved: true,
            barWidth: 4,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _getSpots(List<Task> tasks) {
    Map<String, int> taskCountByDate = {};

    for (Task task in tasks) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(DateFormat.yMMMMEEEEd().parse(task.date));
      taskCountByDate.update(formattedDate, (value) => value + 1, ifAbsent: () => 1);
    }

    List<FlSpot> spots = [];
    int index = 0;

    taskCountByDate.forEach((date, count) {
      spots.add(FlSpot(index.toDouble(), count.toDouble()));
      index++;
    });

    return spots;
  }
}
