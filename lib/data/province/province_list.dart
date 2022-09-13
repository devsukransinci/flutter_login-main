

import 'package:flutter_login/data/province/province.dart';

class ProvinceList {
  List<Province> cachedProvinces = [];
  bool isCached = false;

  int get length => cachedProvinces.length;
  List<Province> get provinces => cachedProvinces;


  void sort([int Function(Province, Province)? compare]) {
    cachedProvinces.sort(compare);
  }

  void insert(int nPos, Province inProvince) {
    cachedProvinces.insert(nPos, inProvince);
  }

  void add(Province inProvince) {
    cachedProvinces.add(inProvince);
  }

}