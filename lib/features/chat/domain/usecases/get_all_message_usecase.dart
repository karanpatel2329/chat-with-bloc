
import 'package:chat_bloc/features/chat/domain/model/chat.dart';
import 'package:chat_bloc/features/chat/domain/repositories/chat_repositories.dart';

class GetAllMessage {
  final HiveChatRepository repository;

  GetAllMessage(this.repository);

  Future<List<Chat>> call() {
    return repository.getAllMessage();
  }
  }