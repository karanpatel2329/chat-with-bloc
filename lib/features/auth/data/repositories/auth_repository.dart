import 'package:chat_bloc/features/auth/domain/models/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
  Future<User> signup(String username, String password, String name);
  Future<User?> checkLogin();
}