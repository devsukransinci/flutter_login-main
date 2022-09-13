import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/ui/app_bar.dart';
import 'package:flutter_login/ui/app_theme.dart';
import 'package:flutter_login/ui/pages/login/login_button_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login/ui/pages/login/login_button.dart';
import 'package:flutter_login/ui/pages/login/email_input.dart';
import 'package:flutter_login/ui/pages/login/password_input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = EmailEditingController();
  final passwordController = PasswordEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => emailController),
          ChangeNotifierProvider(create: (context) => passwordController),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(),
          body: const LoginForm(),
        ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _loginButtonNotifier = LoginButtonChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: MultiProvider(
        providers: [
          Provider(create: (context) => _formKey),
          ChangeNotifierProvider(create: (context) => _loginButtonNotifier),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 100),
              child:
                  Text(LoginPageStrings.header, style: loginHeaderTextStyle),
            ),
            EmailInputField(),
            PasswordInputField(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: LoginButton(),
            ),
          ],
        ),
      ),
    );
  }
}




