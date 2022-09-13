import 'package:flutter/cupertino.dart';
import 'package:flutter_login/data/province/province.dart';

class ProvinceNotifier extends ChangeNotifier {
  Province? _selectedProvince = Province.defaultProvince;

  Province? get value => _selectedProvince;

  void setSelected(Province? newProvince) {
    _selectedProvince = newProvince;
    notifyListeners();
  }

  void setSelectedNoNotify(Province? newProvince) {
    _selectedProvince = newProvince;
  }
}