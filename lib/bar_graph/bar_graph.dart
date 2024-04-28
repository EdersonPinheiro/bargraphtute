import 'package:bargraphtute/bar_graph/ultima_semana_bar_data.dart';
import 'package:bargraphtute/bar_graph/ultimos_tres_meses_bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  final String selectedDuration;
  const BarGraph(
      {Key? key, required this.weeklySummary, required this.selectedDuration})
      : super(key: key);

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

    UltimosTresMesesBarData ultimosTresMeses = UltimosTresMesesBarData(
      primeiroMes: weeklySummary[0],
      segundoMes: weeklySummary[1],
      terceiroMes: weeklySummary[2],
    );

    myBarData.initializeBarData();

    ultimosTresMeses.initializeBarData();

    Widget getUltimaSemana(double value, TitleMeta meta) {
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

    Widget getUltimosTresMeses(double value, TitleMeta meta) {
      const style = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      List<String> days = ['Fev', 'Març', 'Abril'];

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
      barGroups: selectedDuration == 'Ultimos 6 dias'
          ? myBarData.barData
              .map(
                (data) => BarChartGroupData(
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.blueAccent,
                      width: 40,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ],
                  x: data.x,
                ),
              )
              .toList()
          : ultimosTresMeses.barData
              .map(
                (data) => BarChartGroupData(
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.blueAccent,
                      width: 65,
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
            getTitlesWidget: selectedDuration == 'Ultimos 6 dias'
                ? getUltimaSemana
                : getUltimosTresMeses,
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
