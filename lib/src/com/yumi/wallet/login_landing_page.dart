import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/strings.dart';

import 'routes.dart';

class LoginLandingPage extends StatefulWidget {
  const LoginLandingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginLandingPageState();
  }
}

class _LoginLandingPageState extends State<LoginLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          Strings.applicationName,
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
                Strings.walletSettings,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                Strings.importOrCreateWallet,
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
                      child: Text(Strings.useMnemonicPhrase, textAlign: TextAlign.center),
                    )),
                const SizedBox(height: 5),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.loginPassword);
                    },
                    child: const SizedBox(
                      width: 120,
                      child: Text(Strings.createNewWallet, textAlign: TextAlign.center),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
