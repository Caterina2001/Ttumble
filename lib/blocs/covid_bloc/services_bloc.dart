import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ttumble/blocs/covid_bloc/chat_event.dart';
import 'package:ttumble/blocs/covid_bloc/ticket_event.dart';
import 'package:ttumble/models/ticket_model.dart';

import 'package:ttumble/resources/api_repository.dart';

import '../../models/chat_model.dart';
import '../../models/chatu_model.dart';
import '../../models/service_model.dart';
import '../../models/special_model.dart';
import 'chatu_event.dart';

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

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketInitial()) {
    final ApiRepository2 _apiRepository2 = ApiRepository2();

    on<GetTicketList>((event, emit) async {
      try {
        emit(TicketLoading());
        final mList = await _apiRepository2.fetchCovidList2();
        emit(TicketLoaded(mList));
      } on NetworkError {
        emit(TicketError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    final ApiRepository3 _apiRepository3 = ApiRepository3();

    on<GetChatList>((event, emit) async {
      try {
        emit(ChatLoading());
        final mList = await _apiRepository3.fetchCovidList3();
        emit(ChatLoaded(mList));
      } on NetworkError {
        emit(ChatError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

class ChatUBloc extends Bloc<ChatUEvent, ChatUState> {
  ChatUBloc() : super(ChatUInitial()) {
    final ApiRepository4 _apiRepository4 = ApiRepository4();

    on<GetChatUList>((event, emit) async {
      try {
        emit(ChatULoading());
        final mList = await _apiRepository4.fetchCovidList4();
        emit(ChatULoaded(mList));
      } on NetworkError {
        emit(ChatUError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
