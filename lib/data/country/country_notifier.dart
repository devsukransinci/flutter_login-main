import 'package:flutter/cupertino.dart';
import 'package:flutter_login/data/country/country.dart';

class CountryNotifier extends ChangeNotifier {
  Country? _selectedCountry = Country.defaultCountry;

  Country? get value => _selectedCountry;

  void setSelected(Country? newCountry) {
    _selectedCountry = newCountry;
    notifyListeners();
  }

  void setSelectedNoNotify(Country? newCountry) {
    _selectedCountry = newCountry;
  }

  void changed() {
    notifyListeners();
  }
}