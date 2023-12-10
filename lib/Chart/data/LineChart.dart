import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:practice/Chart/data/price.dart';
class LineChartWidget extends StatefulWidget {
  final List<PricePoint> points;

  const LineChartWidget(this.points, {Key? key})
      : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 200,
          width: 300,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                   spots: widget.points.map((point) => FlSpot(point.x, point.y)).toList(),
                  isCurved: true,
                  dotData: const FlDotData(
                    show: true,


                  ),
                  color: Colors.red,

                )
              ],
              borderData: FlBorderData(
                border:  const Border(bottom: BorderSide(), left: BorderSide()),
              ),
              // gridData:const FlGridData(show: true),
              titlesData:  FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: _bottomTitles
                ),
                topTitles: const AxisTitles(
                  sideTitles:  SideTitles(showTitles: false)
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false)
                ),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse){

                },
                touchTooltipData:const  LineTouchTooltipData(
                  tooltipBgColor: Colors.green,
                  tooltipRoundedRadius: 50.0,
                  showOnTopOfTheChartBoxArea: true,
                  fitInsideHorizontally: true,
                  tooltipMargin: 5,
                  tooltipPadding: EdgeInsets.all(5),



                ),
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> indicators) {
                    return indicators.map(
                          (int index) {
                        const line = FlLine(
                            color: Colors.grey,
                            strokeWidth: 1,
                            dashArray: [2, 4]);
                        return const TouchedSpotIndicatorData(
                          line,
                          FlDotData(show: false),
                        );
                      },
                    ).toList();
                  },
                  getTouchLineEnd: (_, __) => double.infinity
              ),
              )




            ),



          ),
        ),
    );




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
    },
  );
}
