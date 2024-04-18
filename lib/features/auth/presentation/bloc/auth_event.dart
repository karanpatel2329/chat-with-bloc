part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);
}

class SignupEvent extends AuthEvent {
  final String username;
  final String password;
  final String name;

  SignupEvent(this.username, this.password, this.name);
}

class CheckLoginEvent extends AuthEvent {
  final BuildContext context;
  CheckLoginEvent(this.context);
}

class LogoutEvent extends AuthEvent {
  final BuildContext context;
  LogoutEvent(this.context);
}