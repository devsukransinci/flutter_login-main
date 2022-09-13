
import 'package:flutter/cupertino.dart';

class LoginButtonChangeNotifier extends ChangeNotifier {
  bool _isEmailValid = false;
  bool _isPassValid = false;

  bool get enabled => _isEmailValid && _isPassValid;

  void setEmailValid(bool isValid) {
    _isEmailValid = isValid;
    notifyListeners();
  }

  void setPasswordValid(bool isValid) {
    _isPassValid = isValid;
    notifyListeners();
  }
}