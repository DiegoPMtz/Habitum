import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
    puntuacion = 0;
  }

  // SETTER y GETTER del token

  get token {
    return _prefs.getString('token');
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  get ultimaPagina {
    return _prefs.getString('ultimaPagina');
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }

  get localId {
    return _prefs.getString('localId');
  }

  set localId(String value) {
    _prefs.setString('localId', value);
  }

  get puntuacion {
    return _prefs.getInt('puntuacion');
  }

  set puntuacion(int value) {
    _prefs.setInt('puntuacion', value);
  }
}
