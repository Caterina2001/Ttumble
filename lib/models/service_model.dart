import 'dart:convert';

class ServiceModel {
  bool? error;
  List<Service>? service;
  ServiceModel.withError(bool errorMessage) {
    error = errorMessage;
  }

  ServiceModel({this.error, this.service});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    error = json['Error'];
    if (json['Service'] != null) {
      service = <Service>[];
      json['Service'].forEach((v) {
        service!.add(new Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Error'] = this.error;
    if (this.service != null) {
      data['Service'] = this.service!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Service {
  String? seId;
  String? seNombre;
  String? seDesp;
  String? seImagen;

  Service({this.seId, this.seNombre, this.seDesp, this.seImagen});

  Service.fromJson(Map<String, dynamic> json) {
    seId = json['se_id'];
    seNombre = json['se_nombre'];
    seDesp = json['se_desp'];
    seImagen = json['se_imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['se_id'] = this.seId;
    data['se_nombre'] = this.seNombre;
    data['se_desp'] = this.seDesp;
    data['se_imagen'] = this.seImagen;
    return data;
  }
}

///