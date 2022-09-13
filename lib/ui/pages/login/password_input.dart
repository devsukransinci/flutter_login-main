import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/ui/app_theme.dart';
import 'package:provider/provider.dart';

import 'login_button_notifier.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({Key? key}) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            LoginPageStrings.passwordInputLabel,
            style: loginInputLabelStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: TextFormField(
            onChanged: onPasswordChanged,
            obscureText: true,
            controller: Provider.of<PasswordEditingController>(context, listen: false),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: LoginPageStrings.passwordInputHint,
            ),
          ),
        ),
      ],
    );
  }

  void onPasswordChanged(String newValue) {
    bool isValid = newValue.isNotEmpty;
    Provider.of<LoginButtonChangeNotifier>(context, listen: false).setPasswordValid(isValid);
  }
}


class PasswordEditingController extends TextEditingController {}