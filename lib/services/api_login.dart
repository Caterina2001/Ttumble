import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ttumble/services/login_service.dart';

/* class ApiLogin {
  Future<LogInService> login(LogIn logIn) async {
    const String url =
        "http://en2gomas.com/api.tumble/controller/usuarioController.php?op=login";
    final Uri uri = Uri.parse(url);

    /*  Uri.parse(
        "http://en2gomas.com/api.tumble/controller/usuarioController.php?op=login"); */

    final response = await http.post(uri, body: logIn.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LogInService.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
} */
