import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habitum3/src/bloc/provider.dart';
import 'package:habitum3/src/providers/usuario_provider.dart';

class SignIn extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return ListView(
      children: [
        // SizedBox(
        //   height: 40,
        // ),
        createEmail(bloc),
        createPassword(bloc),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: createEmailButton(context, bloc),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text("ó"),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: createGoogleButton(context),
        ),
      ],
    );
  }

  Widget createPassword(LoginBloc bloc) {
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
                  borderSide: BorderSide(color: Colors.white)),
              hintText: "Contraseña",
              prefixIcon: SvgPicture.asset(
                'assets/icons/password.svg',
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget createEmail(LoginBloc bloc) {
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
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "Usuario",
              prefixIcon: SvgPicture.asset(
                'assets/icons/user2.svg',
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget createEmailButton(BuildContext context, LoginBloc bloc) {
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
                "Entrar con Email",
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
    usuarioProvider.login(bloc.email, bloc.password);
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget createGoogleButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'home');
      },
      child: Container(
        width: 188,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 6),
            colors: [Colors.red, Color(0x801111)],
          ),
        ),
        child: Center(
          child: Text(
            "Entrar con Google",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
