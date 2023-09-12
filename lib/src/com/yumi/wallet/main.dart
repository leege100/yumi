import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/home_page.dart';
import 'package:yumi/src/com/yumi/wallet/login_landing_page.dart';
import 'package:yumi/src/com/yumi/wallet/login_password_page.dart';
import 'package:yumi/src/com/yumi/wallet/routes.dart';

import 'generate_memo_page.dart';

void main() {
  runApp(YumiApp());
}

class YumiApp extends StatelessWidget {
  YumiApp({super.key});
  bool hasCreatedPassword = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yumi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: hasCreatedPassword ? const HomePage() : const LoginPasswordPage(),
      routes: <String, WidgetBuilder> {
        Routes.home : (context) => const HomePage(),
        Routes.loginLanding : (context) => const LoginLandingPage(),
        Routes.generateMemo : (context) => const GenerateMemoPage(),
        Routes.loginPassword : (context) => const LoginPasswordPage(),
      },
    );
  }
}
