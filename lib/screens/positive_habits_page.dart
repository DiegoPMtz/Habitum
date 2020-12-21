import 'package:flutter/material.dart';
import 'package:habitum3/components/division.dart';
import 'package:habitum3/models/habitos_model.dart';
import 'package:habitum3/providers/habitos_provider.dart';

class PositivePage extends StatefulWidget {
  @override
  _PositivePageState createState() => _PositivePageState();
}

class _PositivePageState extends State<PositivePage> {
  final formKey = GlobalKey<FormState>();
  final habitosProvider = new HabitosProvider();

  HabitoModel habito = new HabitoModel();

  bool _value = true;

  @override
  Widget build(BuildContext context) {
    final HabitoModel habitData = ModalRoute.of(context).settings.arguments;

    if (habitData != null) {
      habito = habitData;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _submit();
          Navigator.pushReplacementNamed(context, 'home');
        },
      ),
      body: SafeArea(
        child: Stack(children: [
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
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _crearHabito(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("Descripcion (opcional)"),
                        ),
                        _crearDescripcion(),
                        SwitchListTile(
                          value: habito.recordatorio,
                          title: Text("Recordatorio"),
                          onChanged: (value) {
                            habito.recordatorio = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _crearDescripcion() {
    return TextFormField(
      initialValue: habito.descripcion,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.sentences,
      maxLines: 3,
      decoration: InputDecoration(),
      onSaved: (value) => habito.descripcion = value,
    );
  }

  Widget _crearHabito() {
    return TextFormField(
      initialValue: habito.habito,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "(Salir a correr en las mañanas, tomar mas agua)",
      ),
      onSaved: (value) => habito.habito = value,
      validator: (value) {
        if (value.length < 4) {
          return "Ingrese el habito";
        } else {
          return null;
        }
      },
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    print("todo ok");

    print(habito.habito);
    print(habito.descripcion);
    print(habito.recordatorio);

    if (habito.id == null) {
      habitosProvider.crearHabito(habito);
    } else {
      habitosProvider.editarHabito(habito);
    }
  }
}
