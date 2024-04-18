
import 'package:chat_bloc/features/chat/domain/model/chat.dart';
import 'package:chat_bloc/features/chat/domain/repositories/chat_repositories.dart';

class SendMessage {
  final HiveChatRepository repository;

  SendMessage(this.repository);

  Future<void> call(String message) {
    return repository.sendMessage(message);
  }
  }