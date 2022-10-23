part of 'services_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object?> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final ServiceModel serviceModel;
  const ServiceLoaded(this.serviceModel);
}

class ServiceError extends ServiceState {
  final String? message;
  const ServiceError(this.message);
}

////
///
///
///
abstract class SpecialState extends Equatable {
  const SpecialState();

  @override
  List<Object?> get props => [];
}

class SpecialInitial extends SpecialState {}

class SpecialLoading extends SpecialState {}

class SpecialLoaded extends SpecialState {
  final SpecialServiceModel specialModel;
  const SpecialLoaded(this.specialModel);
}

class SpecialError extends SpecialState {
  final String? messagee;
  const SpecialError(this.messagee);
}

//////
///
///
abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object?> get props => [];
}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketLoaded extends TicketState {
  final TicektModel ticketModel;
  const TicketLoaded(this.ticketModel);
}

class TicketError extends TicketState {
  final String? message;
  const TicketError(this.message);
}

///

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final ChatModel chatModel;
  const ChatLoaded(this.chatModel);
}

class ChatError extends ChatState {
  final String? message;
  const ChatError(this.message);
}

////
///
///
abstract class ChatUState extends Equatable {
  const ChatUState();

  @override
  List<Object?> get props => [];
}

class ChatUInitial extends ChatUState {}

class ChatULoading extends ChatUState {}

class ChatULoaded extends ChatUState {
  final ChatUModel chatUModel;
  const ChatULoaded(this.chatUModel);
}

class ChatUError extends ChatUState {
  final String? message;
  const ChatUError(this.message);
}
