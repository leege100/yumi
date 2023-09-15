import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/strings.dart';

class ConfirmMnemonicPage extends StatefulWidget {
  const ConfirmMnemonicPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ConfirmMnemonicPageState();
  }
}

class _ConfirmMnemonicPageState extends State<ConfirmMnemonicPage> {

  late String _memo;


  @override
  void initState() {
    _memo = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    List<String> _memoString = _memo.split(" ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          Strings.appName,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        //apply padding horizontal or vertical only
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              Strings.confirmYourMnemonic,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              Strings.confirmYourMnemonicHint,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: const Alignment(0, 0),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(width: 1, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
                onPressed: () {
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(Strings.nextStep, textAlign: TextAlign.center),
                ))
          ],
        ),
      ),
    );
  }
}
