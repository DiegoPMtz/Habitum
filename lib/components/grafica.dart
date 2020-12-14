import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart ' as charts;

class Grafica extends StatefulWidget {
  @override
  _GraficaState createState() => _GraficaState();
}

class _GraficaState extends State<Grafica> {
  @override
  Widget build(BuildContext context) {
    var positivedata = [
      Progress("Lunes", 1),
      Progress("Martes", 3),
      Progress("Miercoles", 2),
      Progress("Jueves", 4),
      Progress("Viernes", 2),
      Progress("Sabado", 6),
      Progress("Domingo", 1),
    ];
    var negativedata = [
      Progress("Lunes", 2),
      Progress("Martes", 4),
      Progress("Miercoles", 6),
      Progress("Jueves", 2),
      Progress("Viernes", 7),
      Progress("Sabado", 1),
      Progress("Domingo", 3),
    ];

    var series = [
      charts.Series(
        domainFn: (Progress progreso, _) => progreso.day,
        measureFn: (Progress progreso, _) => progreso.conteo,
        id: 'Progreso',
        data: positivedata,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series(
        domainFn: (Progress progreso, _) => progreso.day,
        measureFn: (Progress progreso, _) => progreso.conteo,
        id: 'Progreso',
        data: negativedata,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      )
    ];

    var chart = charts.BarChart(
      series,
      vertical: false,
      barGroupingType: charts.BarGroupingType.stacked,
      defaultRenderer: new charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(5)),
    );
    return Container(
      child: chart,
    );
  }
}

class Progress {
  final String day;
  final int conteo;
  Progress(this.day, this.conteo);
}
