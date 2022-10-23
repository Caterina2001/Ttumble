import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ttumble/models/chat_model.dart';
import 'package:ttumble/models/ticket_model.dart';

import '../models/chatu_model.dart';
import '../models/service_model.dart';
import '../models/special_model.dart';

/* class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'http://en2gomas.com/api.tumble/controller/serviceController.php?op=AllService';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
} */
class ApiProvider {
  final Dio dio = Dio();

  String _uri =
      ('http://tumble.growmediard.com//controller/serviceController.php?op=AllService');
  Future<ServiceModel> fetchCovidList() async {
    Response response = await dio.get(_uri);
    if (response.statusCode == 200) {
      //var json = response.body;
      return ServiceModel.fromJson(response.data);
    } else {
      throw Exception('error to load');
    }
  }
}

class ApiProvider1 {
  final Dio dio = Dio();
  //var client = http.Client();

  String _uri =
      ('http://tumble.growmediard.com//controller/serviceController.php?op=SpecialService');
  Future<SpecialServiceModel> fetchCovidList1() async {
    /* try {
      Response response = await dio.get(_uri);
      return CovidModel1.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel1.withError1(false);
    } */
    Response response = await dio.get(_uri);
    if (response.statusCode == 200) {
      //var json = response.body;
      return SpecialServiceModel.fromJson(response.data);
    } else {
      throw Exception('error to load');
    }
  }
}

class ApiProvider2 {
  final Dio dio = Dio();
  //var client = http.Client();

  String _uri =
      ('http://tumble.growmediard.com/controller/ticketController.php?op=GetAll');
  Future<TicektModel> fetchCovidList2() async {
    Response response = await dio.get(_uri);
    if (response.statusCode == 200) {
      //var json = response.body;
      return TicektModel.fromJson(response.data);
    } else {
      throw Exception('error to load');
    }
  }
}

class ApiProvider3 {
  final Dio dio = Dio();
  //var client = http.Client();

  String _uri =
      ('http://tumble.growmediard.com/controller/chatController.php?op=GetAll');
  Future<ChatModel> fetchCovidList3() async {
    Response response = await dio.get(_uri);
    if (response.statusCode == 200) {
      //var json = response.body;
      return ChatModel.fromJson(response.data);
    } else {
      throw Exception('error to load');
    }
  }
}

class ApiProvider4 {
  final Dio dio = Dio();
  //var client = http.Client();

  String _uri =
      ('http://tumble.growmediard.com/controller/chatController.php?op=Get-chat-user');
  Future<ChatUModel> fetchCovidList4(String userId) async {
    Response response = await dio.post(_uri);
    if (response.statusCode == 200) {
      //var json = response.body;
      return ChatUModel.fromJson(response.data);
    } else {
      throw Exception('error to load');
    }
  }
}
