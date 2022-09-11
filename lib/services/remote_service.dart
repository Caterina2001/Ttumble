import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ttumble/models/Services.dart';
import 'package:http/http.dart' as http;
import 'package:ttumble/models/INFO.dart';

import '../models/SpecialServices.dart';

class RemoteService {
  Future<List<Services>?> getServices() async {
    var client = http.Client();

    var uri = Uri.parse(
        'http://en2gomas.com/api.tumble/controller/serviceController.php?op=AllService');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return ServicesFromJson(json);
    } else {
      throw Exception('error to load');
    }
  }
}

class RemoteSpecialService {
  Future<List<SpecialServices>?> getSpecialServices() async {
    var client = http.Client();

    var uri = Uri.parse(
        'http://en2gomas.com/api.tumble/controller/serviceController.php?op=SpecialService');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      /*  final _json = jsonDecode(response.body);
        return new albumFromJson(_json);
      for (final item in jsonDecode(response.body)) Album.fromJson(item);
      var json = response.body; */
      var json = response.body;
      return SpecialServicesFromJson(json);
    }
  }
}

/* class RemoteSignUp {
  Future<SignUp> createSignUp(String fullname) async {
    final response = await http.post(
      Uri.parse(
          'http://en2gomas.com/api.tumble/controller/usuarioController.php?op=Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fullname': fullname,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return SignUp.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
} */
