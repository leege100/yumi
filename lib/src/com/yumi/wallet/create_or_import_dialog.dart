import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/routes.dart';
import 'package:yumi/src/com/yumi/wallet/strings.dart';

class CreateOrImportDialog extends StatelessWidget {
  bool existAccount = false;

  CreateOrImportDialog(this.existAccount, {super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      title: Text(
        Strings.addAccount,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20),
        ),
        existAccount ? Container() : Container(
          margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: const Text(Strings.emptyAccountHint, textAlign: TextAlign.center),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: OutlinedButton(
              onPressed: () => {},
              child: const SizedBox(
                width: double.infinity,
                child: Text(Strings.importExistAccount,
                    textAlign: TextAlign.center),
              )),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.generateMemo);
              },
              child: const SizedBox(
                width: double.infinity,
                child:
                    Text(Strings.createNewAccount, textAlign: TextAlign.center),
              )),
        ),
      ],
    );
  }
}
