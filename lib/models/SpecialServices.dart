// To parse this JSON data, do
//
//     final specialServices = specialServicesFromJson(jsonString);

import 'dart:convert';

List<SpecialServices> SpecialServicesFromJson(String str) =>
    List<SpecialServices>.from(
        json.decode(str).map((x) => SpecialServices.fromJson(x)));

String SpecialServicesToJson(List<SpecialServices> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecialServices {
  SpecialServices({
    required this.seId,
    required this.seNombre,
    required this.seDesp,
    required this.seImagen,
  });

  String seId;
  String seNombre;
  String seDesp;
  String seImagen;

  factory SpecialServices.fromJson(Map<String, dynamic> json) =>
      SpecialServices(
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
