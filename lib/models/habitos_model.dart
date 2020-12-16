import 'dart:convert';

HabitoModel habitoModelFromJson(String str) =>
    HabitoModel.fromJson(json.decode(str));

String habitoModelToJson(HabitoModel data) => json.encode(data.toJson());

class HabitoModel {
  String id;
  String habito;
  String descripcion;
  bool recordatorio;

  HabitoModel({
    this.id,
    this.habito,
    this.descripcion,
    this.recordatorio = false,
  });

  factory HabitoModel.fromJson(Map<String, dynamic> json) => HabitoModel(
        id: json["id"],
        habito: json["habito"],
        descripcion: json["descripcion"],
        recordatorio: json["recordatorio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "habito": habito,
        "descripcion": descripcion,
        "recordatorio": recordatorio,
      };
}
