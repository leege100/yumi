import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/routes.dart';
import 'package:yumi/src/com/yumi/wallet/strings.dart';

class GenerateMnemonicPage extends StatefulWidget {
  const GenerateMnemonicPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GenerateMnemonicPageState();
  }
}

class _GenerateMnemonicPageState extends State<GenerateMnemonicPage> {
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
              Strings.writeDownYourMnemonic,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              Strings.mnemonicPhraseDesc,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              alignment: const Alignment(0, 0),
              width: double.infinity,
              height: 325,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 50,
                ),
                children: [
                  MnemonicItem(1, _memoString[0]),
                  MnemonicItem(2, _memoString[1]),
                  MnemonicItem(3, _memoString[2]),
                  MnemonicItem(4, _memoString[3]),
                  MnemonicItem(5, _memoString[4]),
                  MnemonicItem(6, _memoString[5]),
                  MnemonicItem(7, _memoString[6]),
                  MnemonicItem(8, _memoString[7]),
                  MnemonicItem(9, _memoString[8]),
                  MnemonicItem(10, _memoString[9]),
                  MnemonicItem(11, _memoString[10]),
                  MnemonicItem(12, _memoString[11]),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.confirmMnemonic, arguments: _memo);
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

class MnemonicItem extends StatelessWidget {
  final int _index;
  final String _text;

  const MnemonicItem(this._index, this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        alignment: const Alignment(0, 0),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Text(
          "$_index.  $_text",
          style: Theme.of(context).textTheme.bodyMedium,
          textScaleFactor: 1.1,
          textAlign: TextAlign.center,
        ));
  }
}
