import 'package:flutter/material.dart';
import 'package:flutter_login/data/country/country_map.dart';
import 'package:flutter_login/data/country/country_notifier.dart';
import 'package:flutter_login/data/province/province_notifier.dart';
import 'package:flutter_login/data/user_address/user_address.dart';
import 'package:flutter_login/data/province/province.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button_notifier.dart';
import 'package:provider/provider.dart';


class ProvinceDropDown extends StatefulWidget {
  const ProvinceDropDown({Key? key}) : super(key: key);

  @override
  State<ProvinceDropDown> createState() => _ProvinceDropDownState();
}

class _ProvinceDropDownState extends State<ProvinceDropDown> {

  @override
  Widget build(BuildContext context) {

    return Consumer<CountryNotifier>(
        builder: (context, countryNotifier, child) {
          var countryMap = Provider.of<CountryMap>(context);
          var userAddress = Provider.of<UserAddress?>(context);
          var provinces = countryMap.getProvincesOfCountry(countryNotifier.value!, countryNotifier);

          if(userAddress != null) {

            for(Province province in provinces) {
              if(province.code == userAddress.state) {
                Provider.of<ProvinceNotifier>(context, listen: false).setSelectedNoNotify(province);
                break;
              }
            }
          }
          var currentValue = Provider.of<ProvinceNotifier>(context, listen: false).value!;

          return DropdownButton<Province>(
            value: currentValue,
            isExpanded: true,
            items: getDropdownWidgets(provinces),
            onChanged: onItemChanged,

          );
        }
    );
  }

  void onItemChanged(Province? newProvince) {
    bool isValid = false;
    if((newProvince != null) && newProvince.code.isNotEmpty)  {
      isValid = true;
    }
    Provider.of<SaveAddButtonNotifier>(context, listen: false).setProvinceValid(isValid);

    setState(() {
      Provider.of<ProvinceNotifier>(context, listen: false).setSelected(newProvince);
    });
  }

  List<DropdownMenuItem<Province>> getDropdownWidgets(List<Province> provinces) {
    var mappedItems = provinces.map((province) {
      return DropdownMenuItem<Province>(
          value: province, child: Text(province.name));
    });

    return mappedItems.toList();
  }
}