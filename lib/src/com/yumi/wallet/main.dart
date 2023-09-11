import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/login_landing_page.dart';
import 'package:yumi/src/com/yumi/wallet/routes.dart';

import 'generate_memo.dart';

void main() {
  runApp(const YumiApp());
}

class YumiApp extends StatelessWidget {
  const YumiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yumi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginLandingPage(),
      routes: <String, WidgetBuilder> {
        Routes.generateMemo : (context) => const GenerateMemoPage(),
      },
    );
  }
}
