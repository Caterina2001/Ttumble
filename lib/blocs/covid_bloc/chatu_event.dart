import 'package:equatable/equatable.dart';

abstract class ChatUEvent extends Equatable {
  const ChatUEvent();

  @override
  List<Object> get props => [];
}

class GetChatUList extends ChatUEvent {}
