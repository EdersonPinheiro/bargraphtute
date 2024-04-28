import 'package:bargraphtute/bar_graph/ultima_semana_bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  const BarGraph({Key? key, required this.weeklySummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    UltimaSemanaBarData myBarData = UltimaSemanaBarData(
      segunda: weeklySummary[0],
      terca: weeklySummary[1],
      quarta: weeklySummary[2],
      quinta: weeklySummary[3],
      sexta: weeklySummary[4],
      sabado: weeklySummary[5],
    );

    myBarData.initializeBarData();

    Widget getTitles(double value, TitleMeta meta) {
      const style = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      List<String> days = ['Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

      int index = value.toInt() % days.length;

      Widget text = Text(
        days[index],
        style: style,
      );

      return Container(
        child: SideTitleWidget(
          axisSide: AxisSide.bottom,
          space: 16,
          child: text,
        ),
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
                  color: Colors.blueAccent,
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
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        show: true,
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
