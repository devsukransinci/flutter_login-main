import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.white;
  static const secondary = Colors.black;
  static const loginInputLabel = Colors.black45;
}

class AppURIs {
  static const base = 'https://api.rebag.com/api/v6';
  static const login = '$base/login';
  static const baseAccount = '$base/my-account';
  static const countries = '$baseAccount/countries/';
  static const states = '$baseAccount/states/';
  static const address = '$baseAccount/address/';
}

class AppFontSizes {
  static const appBar = 35.0;
  static const loginHeader = 35.0;
  static const loginInputLabel = 12.0;
  static const addresTitle = 16.0;
  static const addressListButton = 11.0;
}

class AppSizes {
  static const addressEditInputPadding = 10.0;
  static const addressEditColumnPadding = 20.0;
  static const addressEditButtonPadding = 85.0;
  static const addressListEditButtonWidth = 90.0;
  static const addressListEditButtonHeight = 40.0;
  static const addressListCardPadding = 15.0;
}

class NavigationRoutes {
  static const loginRoute = '/';
  static const addressRoute = '/address';
  static const addressEditRoute = '/address/edit';
}

class AddressListPageStrings {
  static const title = 'ADDRESS';
  static const addButton = '+ Add Address';
  static const editButton = 'EDIT';
  static const deleteButton = 'DELETE';
}

class AddressEditPageStrings {
  static const addressHint = 'Address';
  static const companyHint = 'Company (optional)';
  static const cityHint = 'City';
  static const countryHint = 'Country';
  static const provinceHint = 'State/Province';
  static const zipHint = 'Zip Code';
  static const saveButton = 'SAVE ADDRESS';
  static const addButton = 'ADD ADDRESS';
}

class LoginPageStrings {
  static const header = 'LOGIN';
  static const headerFont = 'Joane';
  static const emailInputLabel = 'Email Address';
  static const emailInputHint = 'Email';
  static const passwordInputLabel = 'Password';
  static const passwordInputHint = 'Password';
  static const loginButton = 'LOGIN';
}

class CommonStrings {
  static const appBarText = 'REBAG';
  static const appBarTextFont = 'Plakette';
  static const addressAddedSuccess = 'Address added!';
  static const addressUpdatedSuccess = 'Address updated!';
}

class ErrorStrings {
  static const loginServerError = 'Failed to communicate with the server';
  static const addressAddedError = 'Failed to add address';
  static const addressUpdatedError = 'Failed to update address';
}