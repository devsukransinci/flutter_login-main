import 'package:flutter/material.dart';
import 'package:flutter_login/data/country/country_map.dart';
import 'package:flutter_login/data/country/country_notifier.dart';
import 'package:flutter_login/data/user_address/user_address.dart';
import 'package:flutter_login/data/country/country.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button_notifier.dart';
import 'package:provider/provider.dart';

class CountryDropDown extends StatefulWidget {
  CountryDropDown({Key? key}) : super(key: key);

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {

  @override
  Widget build(BuildContext context) {
    var countryMap = Provider.of<CountryMap>(context);
    var countryList = countryMap.countryList;
    var userAddress = Provider.of<UserAddress?>(context);

    if(userAddress != null) {
      for(Country country in countryList) {
        if(country.code == userAddress.country) {
          Provider.of<CountryNotifier>(context, listen: false).setSelectedNoNotify(country);
          break;
        }
      }
    }
    var currentValue = Provider.of<CountryNotifier>(context, listen: false).value!;

    return DropdownButton<Country>(
      value: currentValue,
      isExpanded: true,
      items: getDropdownWidgets(countryList),
      onChanged: onItemChanged,
    );
  }

  void onItemChanged(Country? newCountry) {

    bool isValid = false;
    if((newCountry != null) && newCountry.code.isNotEmpty)  {
      isValid = true;
    }
    Provider.of<SaveAddButtonNotifier>(context, listen: false).setCountryValid(isValid);

    setState(() {
      Provider.of<CountryNotifier>(context, listen: false).setSelected(newCountry);
    });
  }

  List<DropdownMenuItem<Country>> getDropdownWidgets(List<Country> countryList) {
    var mappedItems = countryList.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Text(country.name),
      );
    });

    return mappedItems.toList();
  }
}