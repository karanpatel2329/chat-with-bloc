// chat_event.dart
part of 'chat_bloc.dart';

abstract class ChatEvent  {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends ChatEvent {
  final String message;

  const SendMessage(this.message);

  @override
  List<Object> get props => [message];
}

class ReceiveMessage extends ChatEvent {
  const ReceiveMessage();

  @override
  List<Object> get props => [];
}

class OldMessages extends ChatEvent {
  const OldMessages();

  @override
  List<Object> get props => [];
}