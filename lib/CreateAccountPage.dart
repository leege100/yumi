import 'package:flutter/material.dart';
import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateAccountPageState();
  }
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  String _memo = "";

  @override
  Widget build(BuildContext context) {
    _memo = bip39.generateMnemonic();
    List<String> _memoString = _memo.split(" ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "YUMI",
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        //apply padding horizontal or vertical only
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              '请写下您的助记词',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              "这是您的助记词，请将它写在纸上并存放在安全的地方。您将在下一步中重新输入此助记词（按顺序）。",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //设置 child 居中
              alignment: const Alignment(0, 0),
              height: 300,
              // width: MediaQuery.of(context).size.width, //边框设置
              width: double.infinity,
              decoration: BoxDecoration(
                //背景
                color: Colors.transparent,
                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                //设置四周边框
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text(_memo),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
                onPressed: () {
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text("下一步", textAlign: TextAlign.center),
                ))
          ],
        ),
      ),
    );
  }
}
