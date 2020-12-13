import 'package:flutter/material.dart';

import 'division.dart';
import 'header.dart';

class Separador extends StatelessWidget {
  const Separador(
    BuildContext context, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Header(
                color: Colors.cyan[700],
                color2: Colors.cyan[900],
              ),
            ],
          ),
        ),
        Hero(
          tag: 'barra1',
          child: Divisiones(
            color: Colors.blue,
            texto: "Positivos",
            ruta: 'positive',
            icono: Icon(Icons.add, color: Colors.white),
            opacidad: 1.0,
          ),
        ),
        Hero(
          tag: 'barra3',
          child: Divisiones(
            color: Colors.red,
            icono: Icon(Icons.remove, color: Colors.white),
            texto: "Negativos",
            ruta: 'negative',
            opacidad: 1.0,
          ),
        ),
        Hero(
          tag: 'barra4',
          child: Divisiones(
            color: Colors.yellow,
            icono: Icon(Icons.calculate, color: Colors.white),
            texto: "Calculadora",
            ruta: 'calculator',
            opacidad: 1.0,
          ),
        ),
        Hero(
          tag: 'barra5',
          child: Divisiones(
            color: Colors.black38,
            icono: Icon(Icons.not_interested, color: Colors.white),
            texto: "Adicciones",
            ruta: 'addictions',
            opacidad: 1.0,
          ),
        ),
      ],
    );
  }
}
