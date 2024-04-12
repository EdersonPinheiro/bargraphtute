import 'package:bargraphtute/bar_graph/bar_graph.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> weeklySumary = [4.40, 2.50, 42.42, 10.50, 10.20, 88.99, 20.10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: BarGraph(
            weeklySummary: weeklySumary,
          ),
        ),
      ),
    );
  }
}
