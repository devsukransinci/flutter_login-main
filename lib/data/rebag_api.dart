import 'dart:async';
import 'dart:convert';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/data/country/country_notifier.dart';
import 'package:flutter_login/data/province/province.dart';
import 'package:flutter_login/data/province/province_list.dart';
import 'package:flutter_login/data/user/user.dart';
import 'package:flutter_login/data/user_address/user_address.dart';
import 'package:flutter_login/data/user_address/user_address_list.dart';
import 'package:http/http.dart' as http;
import 'package:http_status_code/http_status_code.dart';
import 'package:flutter_login/data/rebag_response/rebag_response.dart';
import 'package:flutter_login/data/country/country.dart';

import 'country/country_map.dart';

class RebagApi {
  String? token;

  Map<String, String> get basicHeaders =>
      {'Content-Type': 'application/json; charset=UTF-8'};

  Map<String, String> get authHeaders => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      };

  Future<String> login(User user) async {
    try {
      String userJson = jsonEncode(user.toJson());
      final response = await sendPost(AppURIs.login, basicHeaders, userJson);
      if (response.statusCode == StatusCode.OK) {
        var resp = RebagResponse.fromJson(jsonDecode(response.body));

        //If there is no error, auth was ok so we get the token
        if (resp.error == null) {
          token = resp.auth_token;
          return Future.value("");
        } else {
          return Future.value(resp.error!.message);
        }
      } else {
        return Future.value(ErrorStrings.loginServerError);
      }
    } on TimeoutException catch (_) {
      return Future.value(ErrorStrings.loginServerError);
    }
  }

  Future<UserAddressList> retrieveAddressList() async {
    UserAddressList result = UserAddressList();

    try {
      final response = await sendGet(AppURIs.address, authHeaders);
      if (response.statusCode == StatusCode.OK) {
        var jsonMap = jsonDecode(response.body);
        result.fromJsonMap(jsonMap);
      }
    } on TimeoutException catch (_) {
      //Do nothing, as the result will be empty anyway
    }
    return Future.value(result);
  }

  void retrieveCountryMap(CountryMap outMap) async {
    try {
      final response = await sendGet(AppURIs.countries, basicHeaders);
      if (response.statusCode == StatusCode.OK) {
        String utf8Body = utf8.decode(response.body.runes.toList());
        var countriesJson = jsonDecode(utf8Body);

        for(var countryJson in countriesJson) {
          Country val = Country.fromJson(countryJson);

          outMap.addCountry(val);
        }
        outMap.sortCountries();
      }
    } on TimeoutException catch (_) {}
  }

  Future<void> retrieveProvincesOfCountry(Country inCountry, ProvinceList outList, CountryNotifier notifier) async {
   try {
     final provinceResponse = await sendGet('${AppURIs.states}${inCountry.code}/', basicHeaders);
     if(provinceResponse.statusCode == StatusCode.OK) {

       outList.isCached = true;

       String utf8Body = utf8.decode(provinceResponse.body.runes.toList());
       var jsonProvinces = jsonDecode(utf8Body);

       for(var jsonProvince in jsonProvinces) {
         outList.add(Province.fromJson(jsonProvince));
       }
       outList.sort((Province left, Province right) => left.name.compareTo(right.name));
       outList.insert(0, Province.defaultProvince);

       notifier.changed();
     }
   } on TimeoutException catch (_) {}
  }

  Future<UserAddress> addAddress(UserAddress address) async {
    UserAddress result = UserAddress(address: '', city: '', country: '', zipcode: '');
    try {
      var jsonBody = jsonEncode(address.toJson());
      final addressResponse = await sendPost(AppURIs.address, authHeaders, jsonBody);
      if(addressResponse.statusCode == StatusCode.OK ||
          addressResponse.statusCode == StatusCode.CREATED) {

        String utf8Body = utf8.decode(addressResponse.body.runes.toList());
        var jsonAddress = jsonDecode(utf8Body);
        result = UserAddress.fromJson(jsonAddress);
      }
    } on TimeoutException catch (_) {}

    return Future.value(result);
  }

  Future<bool> updateAddress(UserAddress address) async {
    bool result = false;
    try {
      var jsonBody = jsonEncode(address.toJson());
      final addressResponse = await sendPut('${AppURIs.address}${address.address_id}/', authHeaders, jsonBody);
      if(addressResponse.statusCode == StatusCode.OK) {
        result = true;
      }
    } on TimeoutException catch (_) {}

    return Future.value(result);
  }

  Future<http.Response> sendPost(String endpoint, Map<String, String> inHeaders, String inBody) {
    return http.post(Uri.parse(endpoint),headers: inHeaders, body: inBody).timeout(const Duration(seconds: 5));
  }

  Future<http.Response> sendPut(String endpoint, Map<String, String> inHeaders, String inBody) {
    return http.put(Uri.parse(endpoint),headers: inHeaders, body: inBody).timeout(const Duration(seconds: 5));
  }

  Future<http.Response> sendGet(String endpoint, Map<String, String> inHeaders) {
    return http.get(Uri.parse(endpoint),headers: inHeaders).timeout(const Duration(seconds: 5));
  }

  //Singleton boilerplate
  static RebagApi? _instance;

  RebagApi._internal() {
    _instance = this;
  }

  factory RebagApi() => _instance ?? RebagApi._internal();
}
