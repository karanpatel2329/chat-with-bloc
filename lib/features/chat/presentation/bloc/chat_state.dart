part of 'chat_bloc.dart';

abstract class ChatState  {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class MessagesUpdated extends ChatState {
  final List<Chat> messages;

  const MessagesUpdated(this.messages);

  @override
  List<Object> get props => [messages];
}