import 'package:flutter/material.dart';

import 'package:habitum3/bloc/provider.dart';
import 'package:habitum3/components/habitos_negativos.dart';

// import 'package:habitum3/components/grafica.dart';
import 'package:habitum3/components/habitos_positivos.dart';
import 'package:habitum3/components/menu.dart';
import 'package:habitum3/components/user.dart';
import 'package:habitum3/providers/habitos_provider.dart';

class Home extends StatelessWidget {
  final habitosProvider = new HabitosProvider();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * .2,
                      left: size.width * .12,
                      right: size.width * .12),
                  child: Text(
                    (bloc.user == null) ? "Bienvenido" : "Hola ${bloc.user} ",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Text(
                    "Habitos Positivos",
                    style: TextStyle(fontSize: 25),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height * .3,
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  child: MostrarHabitos(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Text(
                    "Habitos Negativos",
                    style: TextStyle(fontSize: 25),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height * .3,
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  child: MostrarHabitosNeg(),
                ),
              ],
            ),
          ),
          Separador(context),
          UserInfo(),
        ],
      ),
    );
  }
}
