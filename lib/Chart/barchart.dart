import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'data/price.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key, required this.points}) : super(key: key);
  final List<PricePoint> points;

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState(points: points);
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final List<PricePoint> points;

  _BarChartWidgetState({required this.points});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          barGroups: _chartGroups(),
          borderData: FlBorderData(
            border: const Border(left: BorderSide(),
            top: BorderSide(),
            bottom: BorderSide(),
            right: BorderSide()
            ),
              show: false),
          gridData: const FlGridData(show: true),
          titlesData:  FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles)
          )
        ),

      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 8,
        barRods: points
            .map(
              (point) => BarChartRodData(
            fromY: point.y.toDouble(),
            width: 16,
            color: Colors.blue, toY: 10.0, // You can set the color here
          ),
        )
            .toList(),
      ),
    ];
  }
  SideTitles get _bottomTitles => SideTitles(
  showTitles: true,
  getTitlesWidget: (value, meta) {
  String text = '';
  switch (value.toInt()) {
  case 1:
  text = 'Jan';
  break;
  case 3:
  text = 'Mar';
  break;
  case 5:
  text = 'May';
  break;
  case 7:
  text = 'Jul';
  break;
  case 9:
  text = 'Sep';
  break;
  case 11:
  text = 'Nov';
  break;
  }

  return Text(text);
  }
  );

}
