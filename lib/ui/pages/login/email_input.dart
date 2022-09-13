import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/ui/app_theme.dart';
import 'package:flutter_login/ui/pages/login/login_button_notifier.dart';
import 'package:provider/provider.dart';

class EmailEditingController extends TextEditingController {}

class EmailInputField extends StatefulWidget {
  const EmailInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            LoginPageStrings.emailInputLabel,
            style: loginInputLabelStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: TextFormField(
            onChanged: onEmailChanged,
            controller: Provider.of<EmailEditingController>(context, listen: false),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: LoginPageStrings.emailInputHint,
            ),
          ),
        ),
      ],
    );
  }

  void onEmailChanged(String newValue) {
    bool isValid = newValue.isNotEmpty;
    Provider.of<LoginButtonChangeNotifier>(context, listen: false).setEmailValid(isValid);
  }
}