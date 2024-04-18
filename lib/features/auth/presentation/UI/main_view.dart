import 'package:chat_bloc/features/auth/presentation/UI/login.dart';
import 'package:chat_bloc/features/auth/presentation/UI/signup.dart';
import 'package:chat_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add( CheckLoginEvent(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          controller: controller,
          itemBuilder: (context, index) {
            if (index == 0) {
              return LoginScreen(
                controller: controller,
              );
            } else  {
              return SingUpScreen(
                controller: controller,
              );
            } 
          },
        ),
      ),
    );
  }
}