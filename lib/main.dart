import 'package:chat_bloc/features/auth/domain/models/user.dart';
import 'package:chat_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_bloc/features/auth/presentation/UI/login.dart';
import 'package:chat_bloc/features/auth/presentation/UI/main_view.dart';
import 'package:chat_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_bloc/features/chat/domain/model/chat.dart';
import 'package:chat_bloc/features/chat/domain/repositories/chat_repositories.dart';
import 'package:chat_bloc/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  // To intialise the hive database 
  await Hive.initFlutter();  
   Hive.registerAdapter(UserAdapter());
   Hive.registerAdapter(ChatAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            HiveAuthRepository(),
          ),
        ),
        BlocProvider(create: (context) => ChatBloc(channel:WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org/')),chatRepository: HiveChatRepository())),
      
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const MainView(),
      ),
    );
  }
}

