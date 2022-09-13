import 'dart:collection';

import 'package:flutter_login/data/country/country_notifier.dart';
import 'package:flutter_login/data/province/province.dart';
import 'package:flutter_login/data/country/country.dart';
import 'package:flutter_login/data/province/province_list.dart';
import 'package:flutter_login/data/rebag_api.dart';

class CountryMap {
  final HashMap<String, ProvinceList> _countriesMap = HashMap();
  final List<Country> _countries = [];

  List<Country> get countryList => _countries;

  void addCountry(Country inCountry) {
    _countries.add(inCountry);
    _countriesMap[inCountry.code] = ProvinceList();
  }

  void sortCountries() {
    _countries.sort(compareCountry);
    _countries.insert(0, Country.defaultCountry);
  }

  List<Province> getProvincesOfCountry(Country country, CountryNotifier notifier) {
    var list = _countriesMap[country.code];
    if(list == null) return [];
    if(list.isCached && (list.length <= 1)) return [];

    if(!list.isCached) {
      final api = RebagApi();

       api.retrieveProvincesOfCountry(country, list, notifier);
    }

    return list.provinces;
  }

  int compareCountry(Country left, Country right) {
    return left.name.compareTo(right.name);
  }
  int compareProvince(Province left, Province right) {
    return left.name.compareTo(right.name);
  }

  //Singleton boilerplate
  static CountryMap? _instance;
  CountryMap._internal() {
    _countriesMap[Country.defaultCountry.code] = ProvinceList();
    _instance = this;
  }
  factory CountryMap() => _instance ?? CountryMap._internal();
}