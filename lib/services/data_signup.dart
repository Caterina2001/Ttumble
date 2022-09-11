/* import 'dart:core';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:ttumble/services/signup_service.dart';

import '../models/SignUp.dart';

class DataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;

  Future<void> postData(SignUp body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
      isBack = true;
    }

    loading = false;
    notifyListeners();
  }
} */
