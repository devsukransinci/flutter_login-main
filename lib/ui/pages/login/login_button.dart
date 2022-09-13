import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/data/rebag_api.dart';
import 'package:flutter_login/data/user/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login/ui/app_theme.dart';
import 'package:flutter_login/ui/pages/login/login_button_notifier.dart';
import 'package:flutter_login/ui/pages/login/email_input.dart';
import 'package:flutter_login/ui/pages/login/password_input.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  bool isWaiting = false;
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginButtonChangeNotifier>(
        builder: (context, countryNotifier, child) {
          bool isEnabled = countryNotifier.enabled;
          return Column(
            children: [
              CommonButtonSizeBox(
                child: ElevatedButton(
                  style: commonButtonStyle,
                  onPressed: isEnabled ? onLoginPressed : null,
                  child: const Text(LoginPageStrings.loginButton),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: isWaiting
                    ? const CircularProgressIndicator()
                    : Text(errorText, style: const TextStyle(color: Colors.red)
                ),
              )
            ],
          );
        }
    );
  }

  void onLoginPressed() async {
    var emailController = Provider.of<EmailEditingController>(context, listen: false);
    var passwordController = Provider.of<PasswordEditingController>(context, listen: false);

    //Display loading while waiting for response
    setState(() {
      isWaiting = true;
    });

    final api = RebagApi();

    var resString = await api.login(User(username: emailController.text, password: passwordController.text));

    setState(() {
      isWaiting = false;
      errorText = resString;
    });

    if(resString.isEmpty) {
      Navigator.pushReplacementNamed(context, NavigationRoutes.addressRoute);
    }
  }
}