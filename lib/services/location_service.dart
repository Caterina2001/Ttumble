// ignore_for_file: dead_code, unused_element

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location.dart';

import '../models/INFO.dart';

Future<SignUp> createSignUp(
    String number, String fullname, String email, String password) async {
  final response = await http.post(
    Uri.parse(
        'http://tumble.growmediard.com/controller/usuarioController.php?op=Register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'number': number,
      'fullname': fullname,
      'email': email,
      'password': password,
    }),
  );
  /* var json = response.body;
  return AlbumToJson(jsonDecode(json)); */

  // ignore: non_constant_identifier_names

  //return Album.fromJson(jsonDecode(response.body));
  //HomePage();
  //return Album.fromJson(jsonDecode(response.body));
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return SignUp.fromJson(jsonDecode(response.body));
    Location();
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //throw Exception('Failed to create album.');
    return SignUp.fromJson(jsonDecode(response.body));
    Location();
  }
}

List<SignUp> SignUpFromJson(String str) =>
    List<SignUp>.from(json.decode(str).map((x) => SignUp.fromJson(x)));

// ignore: non_constant_identifier_names
String AlbumToJson(List<SignUp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignUp {
  final String number;
  final String fullname;
  final String email;
  final String password;
  /* final String email;
  final String fullname;
  final String password; */

  const SignUp({
    required this.number,
    required this.fullname,
    required this.email,
    required this.password,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        number: json["num_ber"],
        fullname: json["full_name"],
        email: json["e_mail"],
        password: json["pass_word"],
      );

  Map<String, dynamic> toJson() => {
        "num_ber": number,
        "full_name": fullname,
        "e_mail": email,
        "pass_word": password,
      };
}
