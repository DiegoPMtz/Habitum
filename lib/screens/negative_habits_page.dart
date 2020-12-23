import 'package:flutter/material.dart';
import 'package:habitum3/components/division.dart';
import 'package:habitum3/models/habitos_model.dart';
import 'package:habitum3/providers/habitos_provider.dart';
import 'package:habitum3/shared_preferences/preferencias_usuario.dart';
import 'package:intl/intl.dart';

class NegativePage extends StatefulWidget {
  NegativePage({Key key}) : super(key: key);

  @override
  _NegativePageState createState() => _NegativePageState();
}

class _NegativePageState extends State<NegativePage> {
  final formKey = GlobalKey<FormState>();
  final habitosProvider = new HabitosProvider();
  final _prefs = new PreferenciasUsuario();

  HabitoModel habito = new HabitoModel();

  String _fechainicio, _fechafin;
  int _dias = 0;
  TextEditingController _controlador = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    prefs.ultimaPagina = 'negative';
    final HabitoModel habitData = ModalRoute.of(context).settings.arguments;

    if (habitData != null) {
      habito = habitData;
    }
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add),
          onPressed: () {
            _submit();
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
        body: Stack(
          children: [
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
                    opacidad: 0.0,
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
                    "Eliminemos ese mal habito",
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
                            child: Text("Descripción (opcional)"),
                          ),
                          _crearDescripcion(),
                          SwitchListTile(
                            activeColor: Colors.redAccent,
                            value: habito.recordatorio,
                            title: Text("Recordatorio"),
                            onChanged: (value) {
                              habito.recordatorio = value;
                              setState(() {});
                            },
                          ),
                          Container(
                            child: TextFormField(
                              controller: _controlador,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                hintText: "Duración",
                                counterText: "$_dias Dias",
                              ),
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                _fecha();
                              },
                              onSaved: (value) {
                                habito.duracion = value;
                                habito.puntos = (_dias * 25);
                              },
                            ),
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
          ],
        ),
      ),
    );
  }

  Widget _crearDescripcion() {
    return TextFormField(
      initialValue: habito.descripcion,
      textInputAction: TextInputAction.next,
      maxLines: 3,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent)),
      ),
      onSaved: (value) => habito.descripcion = value,
    );
  }

  Widget _crearHabito() {
    return TextFormField(
      initialValue: habito.habito,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent)),
        hintText: "(Tirar basura en la calle, dormir tarde, saltarme comidas)",
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
    _prefs.puntuacion += habito.puntos;

    if (habito.id == null) {
      habitosProvider.crearHabitoneg(habito);
    } else {
      habitosProvider.editarHabitoNeg(habito);
    }
  }

  _fecha() async {
    final DateTimeRange newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022, 7),
      helpText: 'Selecciona un rango',
    );
    setState(() {
      _fechainicio = DateFormat('dd/MM/yyyy').format(newDateRange.start);
      _fechafin = DateFormat('dd/MM/yyyy').format(newDateRange.end);
      _controlador.text = "$_fechainicio - $_fechafin";
      _dias = newDateRange.duration.inDays;
    });

    print(_dias);
  }
}
