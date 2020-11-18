import 'package:flutter/material.dart';
import 'package:habitum3/components/division.dart';
import 'package:habitum3/components/header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: _menudrawer(context),
      body: Builder(
        builder: (context) => Column(
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
