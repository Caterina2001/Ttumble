import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ttumble/resources/api_repository.dart';

import '../../models/service_model.dart';
import '../../models/special_model.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc() : super(ServiceInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetServiceList>((event, emit) async {
      try {
        emit(ServiceLoading());
        final mList = await _apiRepository.fetchCovidList();
        emit(ServiceLoaded(mList));
      } on NetworkError {
        emit(ServiceError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

class SpecialBloc extends Bloc<SpecialEvent, SpecialState> {
  SpecialBloc() : super(SpecialInitial()) {
    final ApiRepository1 _apiRepository1 = ApiRepository1();

    on<GetSpecialList>((event1, emit1) async {
      try {
        emit1(SpecialLoading());
        final mList1 = await _apiRepository1.fetchCovidList1();
        emit1(SpecialLoaded(mList1));
      } on NetworkError {
        emit1(SpecialError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
