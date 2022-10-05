import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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
  //var client = http.Client();

  String _uri =
      ('http://tumble.growmediard.com//controller/serviceController.php?op=AllService');
  Future<ServiceModel> fetchCovidList() async {
    /* try {
      Response response = await dio.get(_uri);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    } */
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
