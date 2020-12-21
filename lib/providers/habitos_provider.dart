import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:habitum3/models/habitos_model.dart';

class HabitosProvider {
  final String _url = 'https://habitum-c1f5b-default-rtdb.firebaseio.com';

  Future<bool> crearHabito(HabitoModel habito) async {
    final url = '$_url/habitos.json';

    final resp = await http.post(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> crearHabitoneg(HabitoModel habito) async {
    final url = '$_url/habitosneg.json';

    final resp = await http.post(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarHabito(HabitoModel habito) async {
    final url = '$_url/habitos/${habito.id}.json';

    final resp = await http.put(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarHabitoNeg(HabitoModel habito) async {
    final url = '$_url/habitosneg/${habito.id}.json';

    final resp = await http.put(url, body: habitoModelToJson(habito));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<HabitoModel>> cargarHabito() async {
    final url = "$_url/habitos.json";

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

  Future<List<HabitoModel>> cargarHabitoNeg() async {
    final url = "$_url/habitosneg.json";

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
    final url = '$_url/habitos/$id.json';
    final resp = await http.delete(url);

    print(resp.body);
    return 1;
  }

  Future<int> borrarHabitoNeg(String id) async {
    final url = '$_url/habitosneg/$id.json';
    final resp = await http.delete(url);

    print(resp.body);
    return 1;
  }
}
