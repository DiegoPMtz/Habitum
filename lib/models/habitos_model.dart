import 'dart:convert';

HabitoModel habitoModelFromJson(String str) =>
    HabitoModel.fromJson(json.decode(str));

String habitoModelToJson(HabitoModel data) => json.encode(data.toJson());

class HabitoModel {
  String id;
  String habito;
  String descripcion;
  bool recordatorio;
  int puntos;
  String duracion;

  HabitoModel({
    this.id,
    this.habito,
    this.descripcion,
    this.recordatorio = false,
    this.puntos = 0,
    this.duracion = '',
  });

  factory HabitoModel.fromJson(Map<String, dynamic> json) => HabitoModel(
        id: json["id"],
        habito: json["habito"],
        descripcion: json["descripcion"],
        recordatorio: json["recordatorio"],
        puntos: json["puntos"],
        duracion: json["duracion"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "habito": habito,
        "descripcion": descripcion,
        "recordatorio": recordatorio,
        "puntos": puntos,
        "duracion": duracion,
      };
}
