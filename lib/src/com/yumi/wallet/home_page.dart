import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/strings.dart';

import 'create/create_or_import_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return CreateOrImportDialog(false);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          Strings.appName,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(useMaterial3: false),
        child: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.wallet),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.history),
                onPressed: () {},
              ),
              const SizedBox(),
              IconButton(
                icon: const Icon(Icons.navigation),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Theme(
        data: ThemeData(useMaterial3: false),
        child: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: _onAdd,
            child: const Icon(Icons.add)),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 90),
              Container(),
            ],
          ),
        ],
      ),
    );
  }

  void _onAdd() {}
}
