import 'package:flutter/material.dart';
import 'package:habitum3/components/SignIn.dart';
import 'package:habitum3/components/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
