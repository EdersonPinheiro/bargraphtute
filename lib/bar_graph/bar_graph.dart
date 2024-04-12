import 'package:bargraphtute/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  const BarGraph({Key? key, required this.weeklySummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      wedAmount: weeklySummary[2],
      thurAmount: weeklySummary[3],
      friAmount: weeklySummary[4],
      satAmount: weeklySummary[5],
    );

    myBarData.initializeBarData();

    Widget getTitles(double value, TitleMeta meta) {
      const style = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

      Widget text = Text(
        days[value.toInt()],
        style: style,
      );

      return SideTitleWidget(
        axisSide: AxisSide.bottom,
        space: 16,
        child: text,
      );
    }

    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      barGroups: myBarData.barData
          .map(
            (data) => BarChartGroupData(
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Colors.blue,
                  width: 35,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ],
              x: data.x,
            ),
          )
          .toList(),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 45,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 30,
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 30,
            showTitles: true,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
      ),
      gridData: FlGridData(drawVerticalLine: false),
    ));
  }
}
