
import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';

final appMainTheme = ThemeData (
  primaryColor: AppColors.primary,
);

const addAddressTextStyle = TextStyle (
  color: AppColors.secondary
);

const addresTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: AppFontSizes.addresTitle
);

const loginInputLabelStyle = TextStyle(
    color: AppColors.loginInputLabel,
    fontSize: AppFontSizes.loginInputLabel,
    fontWeight: FontWeight.bold
);

const loginHeaderTextStyle = TextStyle(
  fontFamily: LoginPageStrings.headerFont,
  fontSize: AppFontSizes.loginHeader,
);

const appBarTextStyle = TextStyle(
  color: AppColors.secondary,
  fontFamily: CommonStrings.appBarTextFont,
  fontSize: AppFontSizes.appBar,
);

var commonButtonStyle = ElevatedButton.styleFrom(
    primary: AppColors.secondary,
    elevation: 1,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
);
var addressCardEditStyle = ElevatedButton.styleFrom(
    primary: AppColors.primary,
    elevation: 1,
    side: const BorderSide(width: 1, color: AppColors.secondary),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
);

const addressListButtonTextStyle = TextStyle(
    color: AppColors.secondary,
    fontSize: AppFontSizes.addressListButton
);

class CommonButtonSizeBox extends SizedBox {
  const CommonButtonSizeBox({Key? key, required Widget child}) : super(key: key, width: 300, height: 50, child: child);
}

class SaveButtonSizeBox extends SizedBox {
  const SaveButtonSizeBox({Key? key, required Widget child}) : super(key: key, width: 280, height: 60, child: child);
}