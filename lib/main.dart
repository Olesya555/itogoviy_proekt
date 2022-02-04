import 'package:itogoviy_proekt/info.dart';
import 'package:flutter/material.dart';
import 'package:itogoviy_proekt/auth_page.dart';
import 'package:itogoviy_proekt/user_screen.dart';
import 'package:itogoviy_proekt/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/users': (context) => const UserScreen(),
        '/tasks': (context) => const TaskMainScreen(),
        '/info': (context) => const InfoPrilogenie(),
      },
    );
  }
}

