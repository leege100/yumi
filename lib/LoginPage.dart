import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "YUMI",
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                '钱包设置',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "导入现有钱包或创建新钱包",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            child: Column(
              children: [
                OutlinedButton(
                    onPressed: () => {},
                    child: const SizedBox(
                      width: 120,
                      child: Text("使用助记词导入", textAlign: TextAlign.center),
                    )),
                const SizedBox(height: 5),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/create_account");
                    },
                    child: const SizedBox(
                      width: 120,
                      child: Text("创建新钱包", textAlign: TextAlign.center),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
