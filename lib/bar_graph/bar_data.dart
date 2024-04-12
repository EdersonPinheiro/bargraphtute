import 'package:bargraphtute/bar_graph/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData(
      {required this.sunAmount,
      required this.monAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount});

  List<IndividualBar> barData = [];

  //Inicializa o barData

  void initializeBarData() {
    barData = [
      //sun
      IndividualBar(x: 0, y: sunAmount),

      //mon
      IndividualBar(x: 0, y: monAmount),

      //tue
      IndividualBar(x: 0, y: wedAmount),

      //wed
      IndividualBar(x: 0, y: thurAmount),

      //fri
      IndividualBar(x: 0, y: friAmount),

      //sat
      IndividualBar(x: 0, y: satAmount)
    ];
  }
}
