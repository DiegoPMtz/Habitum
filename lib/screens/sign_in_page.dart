import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habitum3/components/SignIn.dart';
import 'package:habitum3/components/signup.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final random = Random();
  Color _color;
  Timer _count;
  @override
  void initState() {
    super.initState();

    _color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 0.1);

    _count = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {
        _color = Color.fromRGBO(
            random.nextInt(255), random.nextInt(255), random.nextInt(255), 0.1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final circulo = AnimatedContainer(
      duration: Duration(seconds: 2),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(100),
      ),
    );

    final circulopeq = AnimatedContainer(
      duration: Duration(seconds: 3),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(100),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(child: circulo, top: -5, right: 90),
          Positioned(child: circulopeq, top: 280, left: 20),
          Positioned(child: circulo, bottom: 300, right: -50),
          Positioned(child: circulopeq, bottom: -5, left: 150),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
                Container(
                  child: Image(
                      width: 180,
                      height: 180,
                      image: AssetImage('assets/images/logo.png')),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .55,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      // border: Border.all(
                      //   color: Colors.black.withOpacity(.18),
                      // ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20.0,
                            offset: Offset(15.0, 10.0))
                      ]),
                  child: Column(
                    children: [
                      _tabSection(context),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(tabs: [
            Tab(
              // text: "Entrar",
              child: Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Tab(
              // text: "Registrarse",
              child: Text(
                "Registrarse",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ]),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .45,
          child: TabBarView(children: [
            SignIn(),
            SignUp(),
          ]),
        ),
      ],
    ),
  );
}
