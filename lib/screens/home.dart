import 'package:flutter/material.dart';

import 'package:habitum3/components/menu.dart';

class Home extends StatelessWidget {
  final int positivos = 5;
  final int negativos = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Separador(context),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .2,
                  left: 50,
                  right: 50,
                ),
                child: Text(
                  "Me da gusto verte de nuevo... ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 90),
                child: Text(
                  "Habitos a obtener: $positivos",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 90),
                child: Text(
                  "Habitos a eliminar: $negativos",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
