import 'package:flutter/material.dart';
import 'package:habitum3/bloc/provider.dart';
import 'package:habitum3/providers/usuario_provider.dart';

class SignUp extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        _crearUsuario(bloc),
        _crearCorreo(bloc),
        _crearPassword(bloc),
        SizedBox(
          height: 10,
        ),
        _crearBoton(context, bloc),
      ],
    );
  }

  Widget _crearBoton(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, '/');
            snapshot.hasData ? _login(context, bloc) : null;
          },
          child: Container(
            width: 188,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0, 6),
                colors: [Colors.cyan[700], Color(0x004C54)],
              ),
            ),
            child: Center(
              child: Text(
                "Registrarse",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _login(BuildContext context, LoginBloc bloc) {
    Navigator.pushReplacementNamed(context, 'home');
    usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
  }

  // Widget _confirmarPassword(LoginBloc bloc) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 15,
  //     ),
  //     child: TextField(
  //       obscureText: true,
  //       decoration: InputDecoration(
  //           enabledBorder: UnderlineInputBorder(
  //             borderSide: BorderSide(color: Colors.white),
  //           ),
  //           hintText: "Confirma tu Contraseña",
  //           hintStyle: TextStyle(
  //             color: Colors.white,
  //             fontSize: 20,
  //           )),
  //     ),
  //   );
  // }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              errorText: snapshot.error,
              enabledBorder: UnderlineInputBorder(
                  // borderSide: BorderSide(color: Colors.white),
                  ),
              hintText: "Crea tu Contraseña",
              hintStyle: TextStyle(
                // color: Colors.white,
                fontSize: 20,
              ),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearUsuario(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: TextField(
            decoration: InputDecoration(
              errorText: snapshot.error,
              enabledBorder: UnderlineInputBorder(
                  // borderSide: BorderSide(color: Colors.white),
                  ),
              hintText: "Crea tu Usuario",
              hintStyle: TextStyle(
                // color: Colors.white,
                fontSize: 20,
              ),
            ),
            onChanged: bloc.changeUser,
          ),
        );
      },
    );
  }

  Widget _crearCorreo(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorText: snapshot.error,
              enabledBorder: UnderlineInputBorder(
                  // borderSide: BorderSide(color: Colors.white),
                  ),
              hintText: "Ingresa tu Correo",
              hintStyle: TextStyle(
                // color: Colors.white,
                fontSize: 20,
              ),
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }
}
