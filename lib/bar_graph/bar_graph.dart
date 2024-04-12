import 'package:bargraphtute/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  const BarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        wedAmount: weeklySummary[2],
        thurAmount: weeklySummary[3],
        friAmount: weeklySummary[4],
        satAmount: weeklySummary[5]);

    myBarData.initializeBarData();

    return BarChart(BarChartData(
        maxY: 100,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.blue,
                      width: 25,
                      borderRadius: BorderRadius.circular(4))
                ],
              ),
            )
            .toList()));
  }
}
