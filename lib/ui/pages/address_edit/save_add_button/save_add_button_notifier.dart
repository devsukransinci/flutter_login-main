import 'package:flutter/cupertino.dart';

class SaveAddButtonNotifier extends ChangeNotifier {
  bool _isAddressValid = false;
  bool _isCityValid = false;
  bool _isCountryValid = false;
  bool _isProvinceValid = true;
  bool _isZipValid = false;

  bool get isValid => _isAddressValid && _isCityValid && _isCountryValid && _isProvinceValid && _isZipValid;

  void setAddressValid(bool isValid) {
    _isAddressValid = isValid;
    notifyListeners();
  }

  void setCityValid(bool isValid) {
    _isCityValid = isValid;
    notifyListeners();
  }

  void setCountryValid(bool isValid) {
    _isCountryValid = isValid;
    notifyListeners();
  }

  void setProvinceValid(bool isValid) {
    _isProvinceValid = isValid;
    notifyListeners();
  }

  void setZipValid(bool isValid) {
    _isZipValid = isValid;
    notifyListeners();
  }

  void setAllValid(bool isValid) {
    _isAddressValid = isValid;
    _isCityValid = isValid;
    _isCountryValid = isValid;
    _isProvinceValid = isValid;
    _isZipValid = isValid;
  }

}