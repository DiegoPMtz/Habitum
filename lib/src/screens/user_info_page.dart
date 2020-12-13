import 'package:flutter/material.dart';
import 'package:habitum3/src/bloc/provider.dart';
import 'package:habitum3/src/components/user.dart';
import 'package:habitum3/src/providers/usuario_provider.dart';

import 'package:intl/intl.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final usuarioProvider = new UsuarioProvider();
  String _birthday;
  bool _value = true;

  TextEditingController _controlador = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: Text("Informacion del usuario"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: UserInfo(),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            child: Center(
                child: Text(
              "Editar datos de usuario",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            )),
          ),
          SizedBox(
            height: 30,
          ),
          StreamBuilder(
            stream: bloc.userStream,
            initialData: " ",
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Nombre de usuario",
                  ),
                  onChanged: bloc.changeUser,
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Correo",
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _controlador,
              decoration: InputDecoration(
                hintText: "Fecha de nacimiento",
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _selectDate(context);
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          StreamBuilder(
            stream: bloc.formValidStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: RaisedButton(
                  child: Text("Guardar cambios"),
                  onPressed: () {
                    snapshot.hasData ? _actualizarUsuario(context, bloc) : null;
                  },
                ),
              );
            },
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            child: Center(
              child: Text(
                "Configuraciones",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SwitchListTile(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
                print(_value);
              });
            },
            title: Text("Tema"),
          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1970),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _birthday = DateFormat('dd-MM-yyyy').format(picked);
        _controlador.text = _birthday;
      });
    }
  }

  _actualizarUsuario(BuildContext context, LoginBloc bloc) {
    usuarioProvider.actualizarUsuario(bloc.email, bloc.password, bloc.user);
  }
}
