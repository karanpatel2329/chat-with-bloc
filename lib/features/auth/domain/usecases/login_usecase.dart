import 'package:chat_bloc/features/auth/domain/models/user.dart';
import 'package:chat_bloc/features/auth/data/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(String username, String password) {
    return repository.login(username, password);
  }
}