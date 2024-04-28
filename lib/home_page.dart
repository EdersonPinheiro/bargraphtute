import 'package:bargraphtute/bar_graph/bar_graph.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> weeklySumary = [4.40, 2.50, 42.42, 10.50, 10.20, 88.99, 20.10];
  String selectedDuration = "Ultimos 6 dias"; // Default selection

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Calcula a altura e largura do gráfico
    double graphHeight = screenSize.height * 0.6; // 60% da altura da tela
    double graphWidth = screenSize.width * 0.90; // 90% da largura da tela

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: selectedDuration,
            items: [
              DropdownMenuItem<String>(
                value: "Ultimos 6 dias",
                child: Text("Ultimos 6 dias"),
              ),
              DropdownMenuItem<String>(
                value: "Ultimos 3 Meses",
                child: Text("Ultimos 3 Meses"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedDuration = value!;
                // Update data based on selected duration (implementation needed)
              });
            },
          ),
          Center(
            child: SizedBox(
              height: graphHeight,
              width: graphWidth,
              child: BarGraph(
                weeklySummary: weeklySumary,
                selectedDuration: selectedDuration
              ),
            ),
          ),
        ],
      ),
    );
  }
}
