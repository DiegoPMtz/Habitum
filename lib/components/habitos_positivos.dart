import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habitum3/models/habitos_model.dart';
import 'package:habitum3/providers/habitos_provider.dart';

class MostrarHabitos extends StatefulWidget {
  @override
  _MostrarHabitosState createState() => _MostrarHabitosState();
}

class _MostrarHabitosState extends State<MostrarHabitos> {
  final habitosProvider = new HabitosProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: habitosProvider.cargarHabito(),
      builder:
          (BuildContext context, AsyncSnapshot<List<HabitoModel>> snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: actualizardatos,
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) =>
                  _crearhabito(context, snapshot.data[index]),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<Null> actualizardatos() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      setState(() {});
    });
    return Future.delayed(duration);
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
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
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
