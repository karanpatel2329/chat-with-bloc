import 'package:bloc/bloc.dart';
import 'package:chat_bloc/features/auth/data/data_source/local_data.dart';
import 'package:chat_bloc/features/auth/data/repositories/auth_repository.dart';
import 'package:chat_bloc/features/auth/domain/models/user.dart';
import 'package:chat_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_bloc/features/auth/presentation/UI/login.dart';
import 'package:chat_bloc/features/auth/presentation/UI/main_view.dart';
import 'package:chat_bloc/features/chat/presentation/UI/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final HiveAuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
         await Future.delayed(const Duration(seconds: 2));
        final user = await authRepository.login(event.username, event.password);
        
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

     on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
         await Future.delayed(const Duration(seconds: 2));
        final user = await authRepository.signup(event.username, event.password, event.name);
        
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<CheckLoginEvent>((event, emit) async {
      // emit(AuthLoading());
      try {
        final user = await authRepository.checkLogin();
        print("++++++${user.toString()}");
        if(user!=null){
          Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (context)=>ChatScreen()));
        }
        // emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });


    on<LogoutEvent>((event, emit) async {
      // emit(AuthLoading());
      try {
         final box = await Hive.openBox<User>('loginUser');
          box.delete('login');
          Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (context)=>MainView()));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}