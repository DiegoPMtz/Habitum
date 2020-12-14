import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:async';

import 'package:habitum3/src/components/signin.dart';
import 'package:habitum3/src/components/signup.dart';

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
      duration: Duration(seconds: 1),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(100),
      ),
    );

    final circulopeq = AnimatedContainer(
      duration: Duration(seconds: 5),
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.cyan[700], Colors.grey[600]],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Container(
                  // margin: EdgeInsets.only(top: 50, left: 120),
                  child: Image(
                      width: 180,
                      height: 180,
                      image: AssetImage('assets/images/logo.png')),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .55,
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white.withOpacity(.03),
                    border: Border.all(
                      color: Color(0xFF0A0A0A).withOpacity(.18),
                    ),
                  ),
                  child: Column(
                    children: [
                      _tabSection(context),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                )
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
            Tab(text: "Entrar"),
            Tab(text: "Registrarse"),
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
