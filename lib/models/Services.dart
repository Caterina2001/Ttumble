// To parse this JSON data, do
//
//     final Services = ServicesFromJson(jsonString);

import 'dart:convert';

List<Services> ServicesFromJson(String str) =>
    List<Services>.from(json.decode(str).map((x) => Services.fromJson(x)));

String ServicesToJson(List<Services> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Services {
  Services({
    required this.seId,
    required this.seNombre,
    required this.seDesp,
    required this.seImagen,
  });

  String seId;
  String seNombre;
  String seDesp;
  String seImagen;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        seId: json["se_id"],
        seNombre: json["se_nombre"],
        seDesp: json["se_desp"],
        seImagen: json["se_imagen"],
      );

  Map<String, dynamic> toJson() => {
        "se_id": seId,
        "se_nombre": seNombre,
        "se_desp": seDesp,
        "se_imagen": seImagen,
      };
}
