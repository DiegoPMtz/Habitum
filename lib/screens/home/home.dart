import 'package:flutter/material.dart';
import 'package:habitum3/components/header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _menudrawer(context),
      body: Builder(
        builder: (context) => Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Header(
                    color: Colors.cyan[700],
                    color2: Colors.cyan[900],
                  ),
                  IconButton(
                      alignment: Alignment(2, 10),
                      //iconSize: 35,
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _menudrawer(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Drawer(
        elevation: 16,
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(9)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.cyan[700], Colors.cyan[900]],
                  ),
                ),
                height: 210,
                child: DrawerHeader(
                  child: Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.cover),
                      )),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.cyan[700], Colors.cyan[900]],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Habitos Positivos"),
                onTap: () {
                  Navigator.pushNamed(context, 'positive');
                },
              ),
              Divider(),
              ListTile(
                title: Text("Habitos negativos"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text("Calculadora de calorias"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text("Adicciones"),
                onTap: () {},
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
