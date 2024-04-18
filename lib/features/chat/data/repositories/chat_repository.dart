
import 'package:chat_bloc/features/chat/domain/model/chat.dart';

abstract class ChatRepository {
  Future<void> sendMessage(String message);
  Future<void> recievedMessage(String message);
  Future<List<Chat>> getAllMessage();
}