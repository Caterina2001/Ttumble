import 'package:ttumble/models/service_model.dart';
import 'package:ttumble/models/ticket_model.dart';
import 'package:ttumble/views/utils/variables.dart';

import '../models/chat_model.dart';
import '../models/chatu_model.dart';
import '../models/special_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<ServiceModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class ApiRepository1 {
  final _provider1 = ApiProvider1();

  Future<SpecialServiceModel> fetchCovidList1() {
    return _provider1.fetchCovidList1();
  }
}

class ApiRepository2 {
  final _provider2 = ApiProvider2();

  Future<TicektModel> fetchCovidList2() {
    print(idTicketUnico);
    return _provider2.fetchCovidList2();
  }
}

class ApiRepository3 {
  final _provider3 = ApiProvider3();

  Future<ChatModel> fetchCovidList3() {
    return _provider3.fetchCovidList3();
  }
}

class ApiRepository4 {
  final _provider4 = ApiProvider4();

  Future<ChatUModel> fetchCovidList4() {
    return _provider4.fetchCovidList4('127');
  }
}

class NetworkError extends Error {}
