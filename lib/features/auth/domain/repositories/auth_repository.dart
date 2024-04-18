// data/repositories/hive_auth_repository.dart

import 'package:chat_bloc/features/auth/data/data_source/local_data.dart';
import 'package:chat_bloc/features/auth/data/repositories/auth_repository.dart';
import 'package:chat_bloc/features/auth/domain/models/user.dart';

class HiveAuthRepository implements AuthRepository {
 
  HiveAuthRepository();
  
  HiveAuthDataSource dataSource = HiveAuthDataSource();

  @override
  Future<User> login(String username, String password) {
    return dataSource.login(username, password);
  }

  @override
  Future<User> signup(String username, String password, String name) {
    return dataSource.signup(username, password,name);
  }

  @override
  Future<User?> checkLogin() {
    return dataSource.checkLogin();
  }

}