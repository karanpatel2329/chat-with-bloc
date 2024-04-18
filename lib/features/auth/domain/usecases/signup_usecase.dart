import 'package:chat_bloc/features/auth/domain/models/user.dart';
import 'package:chat_bloc/features/auth/data/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<User> call(String username, String password, String name) {
    return repository.signup(username, password,name);
  }
}