import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:practice/Chart/data/sector.dart';

class PieChartWidget extends StatefulWidget {
  final List<Sector> sector;

  const PieChartWidget(this.sector, {Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  late final String industrySector;
  List<Sector>? get sector => null;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.00,
      child: PieChart(PieChartData(
          sections: _chartSections(widget.sector), centerSpaceRadius: 48.0)),
    );
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 40.0;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
  }
}
