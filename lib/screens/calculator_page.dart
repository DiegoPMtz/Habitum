import 'package:flutter/material.dart';
import 'package:habitum3/components/division.dart';
import 'package:habitum3/shared_preferences/preferencias_usuario.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    prefs.ultimaPagina = 'calculator';
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 'barra0',
            child: Divisiones(
              color: Colors.cyan[700],
              icono: Icon(Icons.home, color: Colors.white),
              texto: "Home",
              ruta: 'home',
              opacidad: 1.0,
            ),
          ),
          Hero(
            tag: 'barra1',
            child: Divisiones(
              color: Colors.blue,
              icono: Icon(Icons.add, color: Colors.white),
              texto: "Positivos",
              ruta: 'positive',
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
              opacidad: 0.0,
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
    );
  }
}
