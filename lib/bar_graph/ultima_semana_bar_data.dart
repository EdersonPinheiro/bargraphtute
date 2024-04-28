import 'package:bargraphtute/bar_graph/individual_bar.dart';

class UltimaSemanaBarData {
  final double segunda;
  final double terca;
  final double quarta;
  final double quinta;
  final double sexta;
  final double sabado;

  UltimaSemanaBarData(
      {required this.segunda,
      required this.terca,
      required this.quarta,
      required this.quinta,
      required this.sexta,
      required this.sabado});

  List<IndividualBar> barData = [];

  //Inicializa o barData

  void initializeBarData() {
    barData = [
      //segunda
      IndividualBar(x: 0, y: segunda),

      //terca
      IndividualBar(x: 1, y: terca),

      //quarta
      IndividualBar(x: 2, y: quarta),

      //quinta
      IndividualBar(x: 3, y: quinta),

      //sexta
      IndividualBar(x: 4, y: sexta),

      //sabado
      IndividualBar(x: 5, y: sabado)
    ];
  }
}
