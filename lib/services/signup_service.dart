// ignore_for_file: dead_code, unused_element

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location.dart';
import 'package:ttumble/views/widgets/modals/login_modalprueba.dart';

import '../models/INFO.dart';
import '../models/RegisterService.dart';

Future<SignUp> createSignUp(
    String number, String fullname, String email, String password) async {
  var user;
  try {
    Response response = await post(
        Uri.parse(
            'https://en2gomas.com/api.tumble/controller/usuarioController.php?op=Register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'number': number,
          'fullname': fullname,
          'email': email,
          'password': password,
        }));
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body.toString());
      print(user); // addnow

      //print(data['token']);
      print('accoun create');
    } else {
      print('failed to create a new account');
    }
  } catch (e) {
    print(e.toString());
    return user;
  }

  return (user);
}

/* class SignUpService {
  // ignore: body_might_complete_normally_nullable
  Future<List<RegisterServices>?> postServices(
      String number, String fullname, String email, String password) async {
    var client = http.Client();

    var uri = Uri.parse(
        'http://en2gomas.com/api.tumble/controller/serviceController.php?op=AllService');

    var response = await client.post(uri);

    if (response.statusCode == 200) {
      /*  final _json = jsonDecode(response.body);
        return new albumFromJson(_json);
      for (final item in jsonDecode(response.body)) Album.fromJson(item);
      var json = response.body; */
      var json = response.body;
      return RegisterServicesFromJson(json);
    }
  }
}
 */

/* Future<SignUp> createSignUp(
    String number, String fullname, String email, String password) async {
      
  final response = await http.post(
    Uri.parse(
        'http://en2gomas.com/api.tumble/controller/usuarioController.php?op=Register'),
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
  if (response.statusCode == 801) {
    return SignUp.fromJson(jsonDecode(response.body));
    Location();
  } else {
    //throw Exception('Failed to create album.');
    //Exception has occurred._TypeError (type 'String' is not a subtype of type 'Map<String, dynamic>')
    return SignUp.fromJson(jsonDecode(response.body));
    Location();
  }
} */

List<SignUp> SignUpFromJson(String str) =>
    List<SignUp>.from(json.decode(str).map((x) => SignUp.fromJson(x)));

// ignore: non_constant_identifier_names
String AlbumToJson(List<SignUp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignUp {
  String? number;
  String? fullname;
  String? email;
  String? password;
  /* final String email;
  final String fullname;
  final String password; */

  SignUp({
    this.number,
    this.fullname,
    this.email,
    this.password,
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
