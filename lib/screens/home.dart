import 'package:flutter/material.dart';

import 'package:habitum3/bloc/provider.dart';

import 'package:habitum3/components/grafica.dart';
import 'package:habitum3/components/menu.dart';

class Home extends StatelessWidget {
  final int positivos = 5;
  final int negativos = 7;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Separador(context),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .2,
                    left: 50,
                    right: 50,
                  ),
                  child: Text(
                    "Me da gusto verte de nuevo... ${bloc.email} ",
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
                  child: Text(
                    "Veamos tu progreso semanal.",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.grey),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Grafica(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
