import 'package:flutter/material.dart';

import 'package:habitum3/bloc/provider.dart';

import 'package:habitum3/components/grafica.dart';
import 'package:habitum3/components/menu.dart';
import 'package:habitum3/components/user.dart';

class Home extends StatelessWidget {
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
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Text(
                      "Veamos tu progreso semanal...",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * .5,
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
          Separador(context),
          UserInfo(),
        ],
      ),
    );
  }
}
