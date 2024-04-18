// data/data_sources/hive_auth_data_source.dart
import 'package:chat_bloc/features/auth/domain/models/user.dart';
import 'package:hive/hive.dart';

class HiveAuthDataSource {
  Future<User> login(String username, String password) async {
    final box = await Hive.openBox<User>('users');
    final user = box.values.firstWhere(
      (user) => user.username == username && user.password == password,
      orElse: () => User(id: '', username: '', password: '', name: ''),
    );

    if (user.id.isEmpty) {
      throw Exception('Invalid username or password');
    }
     final boxLogin = await Hive.openBox<User>('loginUser');
    boxLogin.put('login', user);

    return user;
  }

  Future<User?> checkLogin() async {
    final box = await Hive.openBox<User>('loginUser');
    User? user = await box.get('login');
    if (user == null) {
      // throw Exception('Invalid username or password');
    }

    return user;
  }

  Future<User> signup(String username, String password, String name) async {
    final box = await Hive.openBox<User>('users');
    final userExists = box.values.any((user) => user.username == username);

    if (userExists) {
      throw Exception('Username already taken');
    }

    final user = User(id: DateTime.now().toString(), username: username, password: password, name: name);
    box.put(user.id, user);

    return user;
  }
}