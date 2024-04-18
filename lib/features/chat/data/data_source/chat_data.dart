// data/data_sources/hive_auth_data_source.dart
import 'package:chat_bloc/features/auth/domain/models/user.dart';
import 'package:chat_bloc/features/chat/domain/model/chat.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class HiveChatDataSource {
  Future<List<Chat>> getAllMessage() async {
    final box = await Hive.openBox<Chat>('chats');
    final chats = box.toMap().values.toList().cast<Chat>();
    return chats;
  }

  Future<void> sendMessage(String message,) async {
    final box = await Hive.openBox<Chat>('chats');
    final chat = Chat(message: message, isSended: true);
    box.put(DateTime.now().toIso8601String(), chat);

  }
   Future<void> recievedMessage(String message,) async {
    final box = await Hive.openBox<Chat>('chats');
    final chat = Chat(message: message, isSended: false);
    box.put(DateTime.now().toIso8601String(), chat);

  }
}