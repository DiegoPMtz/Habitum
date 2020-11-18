import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);

  @override
  SizedBox build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: Drawer(
        elevation: 25,
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide.none),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(9)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.cyan[500], Colors.cyan[900]],
                  ),
                ),
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.cyan[500], Colors.cyan[900]],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Habitos Positivos",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(Icons.add),
                onTap: () {
                  Navigator.pushNamed(context, 'positive');
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Habitos negativos",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(Icons.remove),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Calculadora de calorias",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(Icons.calculate),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Adicciones",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(Icons.not_interested),
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
