import 'package:flutter/material.dart';

import 'package:habitum3/bloc/provider.dart';

import 'package:habitum3/components/grafica.dart';
import 'package:habitum3/components/menu.dart';
import 'package:habitum3/components/user.dart';
import 'package:habitum3/models/habitos_model.dart';
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
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Text(
                      "Veamos tu progreso semanal...",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .8,
                  padding: EdgeInsets.only(left: 50),
                  child: _mostrarHabitos(),
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

  Widget _mostrarHabitos() {
    return FutureBuilder(
      future: habitosProvider.cargarHabito(),
      builder:
          (BuildContext context, AsyncSnapshot<List<HabitoModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) =>
                _crearhabito(context, snapshot.data[index]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearhabito(BuildContext context, HabitoModel habito) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: (direccion) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("¿Eliminar habito?"),
                content: Text(
                    "¿Estas seguro que deseas eliminar el habito de tu lista?"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("No")),
                  TextButton(
                      onPressed: () {
                        habitosProvider.borrarHabito(habito.id);
                        Navigator.pop(context);
                      },
                      child: Text("Si")),
                ],
              );
            });
      },
      child: ListTile(
        title: Text('${habito.habito}'),
        subtitle: Text('${habito.descripcion}'),
        onTap: () =>
            Navigator.pushNamed(context, 'positive', arguments: habito),
      ),
    );
  }
}
