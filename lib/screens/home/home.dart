import 'package:flutter/material.dart';
import 'package:habitum3/components/header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: _menudrawer(),
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
                          alignment: Alignment(2, 5),
                          //iconSize: 35,
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          })
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  SizedBox _menudrawer() {
    return SizedBox(
      width: 156,
      child: Drawer(
        elevation: 16,
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 218,
                child: DrawerHeader(
                  child: Text("Habitum"),
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
                title: Text("Hola"),
              ),
              ListTile(
                title: Text("Adios"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
