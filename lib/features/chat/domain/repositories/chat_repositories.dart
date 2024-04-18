


import 'package:chat_bloc/features/chat/data/data_source/chat_data.dart';
import 'package:chat_bloc/features/chat/data/repositories/chat_repository.dart';
import 'package:chat_bloc/features/chat/domain/model/chat.dart';

class HiveChatRepository implements ChatRepository {
 
  HiveChatRepository();
  
  HiveChatDataSource dataSource = HiveChatDataSource();

  @override
  Future<List<Chat>> getAllMessage() {
    return dataSource.getAllMessage();
  }

  @override
  Future<void> sendMessage(String message) {
    return dataSource.sendMessage(message);
  }

   @override
  Future<void> recievedMessage(String message) {
    return dataSource.recievedMessage(message);
  }

  
}