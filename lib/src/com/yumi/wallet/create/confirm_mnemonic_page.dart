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

  String _mnemonic = "";
  List<String> _memoString = [];
  bool _initMnemonic = false;


  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    if (!_initMnemonic) {
      _mnemonic = ModalRoute.of(context)!.settings.arguments as String;
      _memoString = _mnemonic.split(" ");
      _initMnemonic = true;
    }

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
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: const Alignment(0, 0),
              width: double.infinity,
              height: 190,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 36,
                ),
                itemCount: _memoString.length,
                itemBuilder: (context, index) {
                  return _MnemonicItem(_memoString[index]);
                },
              ),
            ),
            const SizedBox(height: 10),
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

class _MnemonicItem extends StatelessWidget {
  final String _text;

  const _MnemonicItem(this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        alignment: const Alignment(0, 0),
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(width: 1, color: Colors.lightBlue),
        ),
        child: Text(
          _text,
          style: Theme.of(context).textTheme.bodyMedium,
          textScaleFactor: 1.0,
          textAlign: TextAlign.center,
        ));
  }
}
