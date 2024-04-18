import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_bloc/features/chat/domain/model/chat.dart';
import 'package:chat_bloc/features/chat/domain/repositories/chat_repositories.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketChannel channel;
  final HiveChatRepository chatRepository;
  StreamSubscription? _channelSubscription;
  List<Chat> messages = [];

  ChatBloc({required this.channel, required this.chatRepository}) : super(ChatInitial()) {
    _channelSubscription = channel.stream.listen((message) {
     try{
        print("++++++++++++${message}");
        chatRepository.recievedMessage(message);
       messages.add(Chat(message: message, isSended: false));
      add(ReceiveMessage());
     }catch(e){
        print("++++++++++++++${e}");
     }
    });

    on<SendMessage>((event, emit) {

      chatRepository.sendMessage(event.message);
       emit(MessagesUpdated((messages..add(Chat(message: event.message, isSended: true))).reversed.toList()));
       channel.sink.add(event.message);
    });

    on<ReceiveMessage>((event, emit) {
      print('**************${messages}');
      emit(MessagesUpdated(messages.reversed.toList()));
    });

    on<OldMessages>((event, emit) async {
      messages = await chatRepository.getAllMessage();
      emit(MessagesUpdated(messages.reversed.toList()));
    });
  }

  @override
  Future<void> close() {
    _channelSubscription?.cancel();
    channel.sink.close();
    return super.close();
  }
}