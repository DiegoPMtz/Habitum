import 'package:flutter/material.dart';

class Divisiones extends StatefulWidget {
  const Divisiones({
    Key key,
    this.color,
    this.icono,
    this.texto,
    this.ruta,
    this.opacidad,
  }) : super(key: key);

  final Color color;
  final String texto;
  final Icon icono;
  final String ruta;
  final double opacidad;

  @override
  _DivisionesState createState() => _DivisionesState();
}

class _DivisionesState extends State<Divisiones> {
  bool _click = false;

  void _pulsado() {
    setState(() {
      _click = !_click;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !_click ? botonDesactivado(context) : botonActivado(context);
  }

  GestureDetector botonDesactivado(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _pulsado();
      },
      onTap: () {
        Navigator.of(context).pushReplacementNamed(widget.ruta);
      },
      child: Opacity(
        opacity: widget.opacidad,
        child: Container(
          margin: EdgeInsets.only(right: 387, top: 50),
          height: 80,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: widget.color,
          ),
          child: Container(
            // margin: EdgeInsets.only(top: 30, left: 10),
            child: widget.icono,
          ),
        ),
      ),
    );
  }

  GestureDetector botonActivado(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _pulsado();
      },
      onTap: () {
        Navigator.of(context).pushReplacementNamed(widget.ruta);
      },
      child: Opacity(
        opacity: widget.opacidad,
        child: Container(
          margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .8, top: 50),
          height: MediaQuery.of(context).size.height * .09,
          width: MediaQuery.of(context).size.width * .2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: widget.color,
          ),
          child: Container(
            // margin: EdgeInsets.only(top: 30, left: 10),
            child: Center(
                child: Text(
              widget.texto,
            )),
          ),
        ),
      ),
    );
  }
}
