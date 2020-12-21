import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habitum3/models/habitos_model.dart';
import 'package:habitum3/providers/habitos_provider.dart';

class MostrarHabitosNeg extends StatefulWidget {
  @override
  _MostrarHabitosNegState createState() => _MostrarHabitosNegState();
}

class _MostrarHabitosNegState extends State<MostrarHabitosNeg> {
  final habitosProvider = new HabitosProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: habitosProvider.cargarHabitoNeg(),
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
                        habitosProvider.borrarHabitoNeg(habito.id);
                        Navigator.pop(context);
                      },
                      child: Text("Si")),
                ],
              );
            });
      },
      child: ListTile(
        title: Text(
          '${habito.habito}',
          style: TextStyle(fontSize: 18, color: Colors.redAccent),
        ),
        subtitle: Text(
          '${habito.descripcion}',
          style: TextStyle(fontSize: 16),
        ),
        onTap: () =>
            Navigator.pushNamed(context, 'negative', arguments: habito),
      ),
    );
  }
}
