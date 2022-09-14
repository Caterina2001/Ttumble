import 'package:ttumble/models/service_model.dart';

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

class NetworkError extends Error {}
