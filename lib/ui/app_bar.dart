import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/ui/app_theme.dart';


class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          title: const Text(CommonStrings.appBarText),
          elevation: 0,
          titleTextStyle: appBarTextStyle,
          centerTitle: true,
          backgroundColor: Colors.white,
        );
}
