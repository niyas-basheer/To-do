import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TaskPieChart extends StatelessWidget {
  final List<ChartData> chartData;

  TaskPieChart({required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          dataSource: chartData,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, {this.color = Colors.blue});
  final String x;
   double y;
  final Color color;
}
