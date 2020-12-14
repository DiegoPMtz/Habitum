import 'package:flutter/material.dart';
import 'package:habitum3/src/components/division.dart';

class PositivePage extends StatelessWidget {
  String positivo1 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[100],
          ),
          Column(
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
                  opacidad: 0.0,
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
          Container(
            padding: EdgeInsets.all(45),
            child: Column(
              children: [
                Text(
                  "Crea un nuevo habito",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: TextField(
                    cursorColor: Colors.cyan,
                    decoration: InputDecoration(
                      prefix: SizedBox(
                        width: 8,
                      ),
                      hintText:
                          "(Salir a correr en las mañanas, tomar mas agua)",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (valor) {
                      positivo1 = valor;
                      print(positivo1);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .14,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[200],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Descripcion"),
                      TextField(
                        cursorColor: Colors.cyan,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.pushNamed(context, '/', arguments: positivo1);
                    },
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}