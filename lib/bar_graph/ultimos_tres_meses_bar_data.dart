import 'package:bargraphtute/bar_graph/individual_bar.dart';

class UltimosTresMesesBarData {
  final double primeiroMes;
  final double segundoMes;
  final double terceiroMes;

  UltimosTresMesesBarData(
      {required this.primeiroMes,
      required this.segundoMes,
      required this.terceiroMes,
});

  List<IndividualBar> barData = [];

  //Inicializa o barData

  void initializeBarData() {
    barData = [
      //primeiroMes
      IndividualBar(x: 0, y: primeiroMes),

      //segundoMes
      IndividualBar(x: 1, y: segundoMes),

      //quarta
      IndividualBar(x: 2, y: terceiroMes),
    ];
  }
}
