import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            margin: EdgeInsets.only(top: 50, left: 120),
            child: Image(
                width: 180,
                height: 180,
                image: AssetImage('assets/images/logo.png')),
          ),
          Container(
            height: 350,
            width: 448,
            margin: EdgeInsets.only(
              top: 257,
              left: 55,
              right: 55,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white.withOpacity(.03),
              border: Border.all(
                color: Color(0xFF0A0A0A).withOpacity(.18),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'signin');
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Registrarse",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Crea tu Usuario",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Crea tu Contraseña",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Confirma tu Contraseña",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
