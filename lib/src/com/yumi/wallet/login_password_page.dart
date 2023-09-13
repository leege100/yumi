import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumi/src/com/yumi/wallet/routes.dart';
import 'package:yumi/src/com/yumi/wallet/strings.dart';

class LoginPasswordPage extends StatefulWidget {
  const LoginPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPasswordPageState();
  }
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {
  static const int pwdMinLength = 8;
  bool _checked = false;
  bool _obscureText = true;
  String _password = "";
  String _confirmPassword = "";

  @override
  Widget build(BuildContext context) {
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
              Strings.createPassword,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              Strings.createPasswordDesc,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 52),
            GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                    _obscureText ? Strings.showPassword : Strings.hidePassword,
                    textAlign: TextAlign.end),
              ),
            ),
            TextField(
              autofocus: true,
              obscureText: _obscureText,
              maxLength: 16,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                _password = value;
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top:0, bottom: 12),
                  labelText: Strings.password,
                  hintText: Strings.passwordHint),
            ),
            TextField(
              obscureText: _obscureText,
              maxLength: 16,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                _confirmPassword = value;
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top:6, bottom: 12),
                  labelText: Strings.confirmPassword,
                  hintText: Strings.confirmPasswordHint),
            ),
            Row(
              children: [
                Text(
                  Strings.atLeast8Chars,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),

            const SizedBox(height: 36),
            Row(
              children: [
                Checkbox(
                  value: _checked,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: Colors.blueGrey, //选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checked = value!;
                    });
                  },
                ),
                Text(
                    Strings.confirmCannotRestorePassword,
                    style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (_password.isEmpty || _password.length < pwdMinLength) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(Strings.passwordLengthShouldAtLeast8)),
                    );
                    return;
                  }
                  if (_password != _confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(Strings.passwordShouldSame)),
                    );
                    return;
                  }
                  if(!_checked) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(Strings.pleaseConfirmCannotRestorePassword)),
                    );
                    return;
                  }
                  Navigator.popAndPushNamed(context, Routes.home);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child:
                      Text(Strings.confirm, textAlign: TextAlign.center),
                ))
          ],
        ),
      ),
    );
  }
}
