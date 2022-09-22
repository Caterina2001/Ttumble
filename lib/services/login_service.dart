// ignore_for_file: dead_code, unused_element

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location.dart';

import '../models/INFO.dart';

Future<LogIn> createLogIn(
  String user,
  String pass,
) async {
  final response = await http.post(
    Uri.parse(
        'https://en2gomas.com/api.tumble/controller/usuarioController.php?op=Register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user': user,
      'pass': pass,
    }),
  );
  /* var json = response.body;
  return AlbumToJson(jsonDecode(json)); */

  // ignore: non_constant_identifier_names

  //return Album.fromJson(jsonDecode(response.body));
  //HomePage();
  //return Album.fromJson(jsonDecode(response.body));
  if (response.statusCode == 601) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return LogIn.fromJson(jsonDecode(response.body));
    Location();
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //throw Exception('Failed to create album.');
    return LogIn.fromJson(jsonDecode(response.body));
    Location();
  }
}

List<LogIn> LogInFromJson(String str) =>
    List<LogIn>.from(json.decode(str).map((x) => LogIn.fromJson(x)));

// ignore: non_constant_identifier_names
String AlbumToJson(List<LogIn> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogIn {
  final String user;
  final String pass;

  const LogIn({
    required this.user,
    required this.pass,
  });

  factory LogIn.fromJson(Map<String, dynamic> json) => LogIn(
        user: json["user_"],
        pass: json["pass_"],
      );

  Map<String, dynamic> toJson() => {
        "user_": user,
        "pass_": pass,
      };
}

/* 
class LogInService {
  final String token;
  final String error;

  // ignore: non_constant_identifier_names
  LogInService({required this.token, required this.error});

  factory LogInService.fromJson(Map<String, dynamic> json) {
    return LogInService(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class LogIn {
  String user;
  String pass;

  LogIn({
    required this.user,
    required this.pass,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "user": user.trim(),
      "pass": pass.trim(),
    };
    return map;
  }
} */
