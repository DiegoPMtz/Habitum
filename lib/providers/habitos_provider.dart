import 'dart:convert';

import 'package:habitum3/shared_preferences/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

import 'package:habitum3/models/habitos_model.dart';

class HabitosProvider {
  final String _url = 'https://habitum-c1f5b-default-rtdb.firebaseio.com';

  final _prefs = new PreferenciasUsuario();

  Future<bool> crearHabito(HabitoModel habito) async {
    final url = '$_url/${_prefs.localId}/habitos.json?auth=${_prefs.token}';

    final resp = await http.post(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> crearHabitoneg(HabitoModel habito) async {
    final url = '$_url/${_prefs.localId}/habitosneg.json?auth=${_prefs.token}';

    final resp = await http.post(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarHabito(HabitoModel habito) async {
    final url =
        '$_url/${_prefs.localId}/habitos/${habito.id}.json?auth=${_prefs.token}';

    final resp = await http.put(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarHabitoNeg(HabitoModel habito) async {
    final url =
        '$_url/${_prefs.localId}/habitosneg/${habito.id}.json?auth=${_prefs.token}';

    final resp = await http.put(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<HabitoModel>> cargarHabito() async {
    final url = "$_url/${_prefs.localId}/habitos.json?auth=${_prefs.token}";

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<HabitoModel> habitos = new List();

    if (decodedData != null) {
      decodedData.forEach((id, habito) {
        final habitTemp = HabitoModel.fromJson(habito);
        habitTemp.id = id;

        habitos.add(habitTemp);
      });
    }

    if (decodedData['error'] != null) return [];

    return habitos;
  }

  Future<List<HabitoModel>> cargarHabitoNeg() async {
    final url = "$_url/${_prefs.localId}/habitosneg.json?auth=${_prefs.token}";

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<HabitoModel> habitos = new List();

    if (decodedData != null) {
      decodedData.forEach((id, habito) {
        final habitTemp = HabitoModel.fromJson(habito);
        habitTemp.id = id;

        habitos.add(habitTemp);
      });
    }

    return habitos;
  }

  Future<int> borrarHabito(String id) async {
    final url = '$_url/${_prefs.localId}/habitos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print(resp.body);
    return 1;
  }

  Future<int> borrarHabitoNeg(String id) async {
    final url =
        '$_url/${_prefs.localId}/habitosneg/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print(resp.body);
    return 1;
  }
}
