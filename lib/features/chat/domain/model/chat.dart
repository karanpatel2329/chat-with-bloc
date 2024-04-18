import 'package:hive/hive.dart';

part 'chat.g.dart';

@HiveType(typeId: 1)
class Chat {
  @HiveField(0)
  final String message;

  @HiveField(1)
  final bool isSended;


  Chat({required this.message, required this.isSended,});
}