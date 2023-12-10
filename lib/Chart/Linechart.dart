import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:practice/Services/Gets/service/view.dart';

class LineChartView extends StatefulWidget {
  const LineChartView({super.key});

  @override
  State<LineChartView> createState() => _LineChartViewState();
}

class _LineChartViewState extends State<LineChartView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
        
      ),
      body: Container(
        child: LineChart(LineChartData(
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: chartData
            )
          ]

        )),
      ),
    );
  }
}
List<FlSpot> chartData = [
  FlSpot(0, 1),
  FlSpot(1, 3),
  FlSpot(2, 10),
  FlSpot(3, 7),
  FlSpot(4, 12),
  FlSpot(5, 13),
  FlSpot(6, 17),
  FlSpot(7, 15),
  FlSpot(8, 20),
];

