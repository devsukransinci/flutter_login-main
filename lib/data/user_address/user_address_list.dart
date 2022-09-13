import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_login/data/rebag_api.dart';
import 'package:flutter_login/data/user_address/user_address.dart';

class UserAddressList extends ChangeNotifier {
  final List<UserAddress> _list = [];

  UnmodifiableListView<UserAddress> get list => UnmodifiableListView(_list);

  Future<bool> add(UserAddress address) async{
    bool added = false;
    UserAddress res = await RebagApi().addAddress(address);
    if(res.address_id != -1) {
      added = true;
      _list.add(address);
      notifyListeners();
    }
    return Future.value(added);
  }

  Future<bool> update(UserAddress address) async{
    int index = _list.indexOf(address);
    bool res = await RebagApi().updateAddress(address);
    if(res) {
      if(index != -1) {
        _list[index] = address;
      }
      notifyListeners();
    }
    return Future.value(res);
  }

  void fromJsonMap(Map<String, dynamic> json) {
    List<dynamic> addresses = json['addresses'];
    for(var addressJson in addresses) {
      _list.add(UserAddress.fromJson(addressJson));
    }
  }
}