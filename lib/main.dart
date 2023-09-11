import 'package:flutter/material.dart';
import 'package:yumi/LoginPage.dart';

import 'CreateAccountPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yumi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: <String, WidgetBuilder> {
        "/create_account" : (context) => const CreateAccountPage(),
      },
    );
  }
}
