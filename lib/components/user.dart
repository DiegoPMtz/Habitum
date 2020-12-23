import 'package:flutter/material.dart';
import 'package:habitum3/bloc/provider.dart';
import 'package:habitum3/models/habitos_model.dart';
import 'package:habitum3/providers/habitos_provider.dart';
import 'package:habitum3/shared_preferences/preferencias_usuario.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final habito = HabitosProvider();
    final bloc = Provider.of(context);
    setState(() {});
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: 35, left: 20),
          child: GestureDetector(
            child: CircleAvatar(
              child: Icon(
                Icons.supervised_user_circle,
                size: 60,
              ),
              backgroundColor: Colors.white54,
              radius: 35.0,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('user');
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${bloc.email}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Puntuacion: ${_prefs.puntuacion} pts",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
