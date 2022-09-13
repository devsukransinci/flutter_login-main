import 'package:flutter/material.dart';
import 'package:flutter_login/ui/app_theme.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/data/country/country_notifier.dart';
import 'package:flutter_login/data/province/province_notifier.dart';
import 'package:flutter_login/data/user_address/user_address.dart';
import 'package:flutter_login/data/user_address/user_address_list.dart';
import 'package:flutter_login/ui/pages/address_edit/inputs/address_input.dart';
import 'package:flutter_login/ui/pages/address_edit/inputs/city_input.dart';
import 'package:flutter_login/ui/pages/address_edit/inputs/company_input.dart';
import 'package:flutter_login/ui/pages/address_edit/inputs/zip_input.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button_notifier.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SaveAddButton extends StatefulWidget {
  const SaveAddButton({Key? key}) : super(key: key);

  @override
  State<SaveAddButton> createState() => _SaveAddButtonState();
}

class _SaveAddButtonState extends State<SaveAddButton> {
  @override
  Widget build(BuildContext context) {
    var address = Provider.of<UserAddress?>(context, listen: false);

    return Consumer<SaveAddButtonNotifier>(
        builder: (context, countryNotifier, child) {
      bool isValid = countryNotifier.isValid;

      return SaveButtonSizeBox(
        child: ElevatedButton(
          style: commonButtonStyle,
          onPressed: isValid ? onSaveAddPressed : null,
          child: getButtonText(address),
        ),
      );
    });
  }

  Text getButtonText(UserAddress? address) {
    var address = Provider.of<UserAddress?>(context, listen: false);
    if ((address != null)) {
      return const Text(AddressEditPageStrings.saveButton);
    } else {
      return const Text(AddressEditPageStrings.addButton);
    }
  }

  Future<void> onSaveAddPressed() async {
    var userAddress = Provider.of<UserAddress?>(context, listen: false);
    var addressList = Provider.of<UserAddressList>(context, listen: false);
    var addressControl =
        Provider.of<AddressEditingController>(context, listen: false);
    var companyControl =
        Provider.of<CompanyEditingController>(context, listen: false);
    var cityControl =
        Provider.of<CityEditingController>(context, listen: false);
    var zipControl =
        Provider.of<ZipCodeEditingController>(context, listen: false);
    var countrySelected = Provider.of<CountryNotifier>(context, listen: false);
    var provinceSelected =
        Provider.of<ProvinceNotifier>(context, listen: false);

    String address = addressControl.text;
    String company = companyControl.text;
    String city = cityControl.text;
    String zipcode = zipControl.text;

    String province = '';
    String country = '';

    if (countrySelected.value != null) {
      country = countrySelected.value!.code;
    }
    if (provinceSelected.value != null) {
      province = provinceSelected.value!.code;
    }

    if (userAddress == null) {
      //Add
      UserAddress addressToAdd = UserAddress(
          address: address,
          city: city,
          country: country,
          zipcode: zipcode,
          state: province,
          company: company);
      bool added = await addressList.add(addressToAdd);
      if(added) {
        Fluttertoast.showToast(msg: CommonStrings.addressAddedSuccess);
      } else {
        Fluttertoast.showToast(msg: ErrorStrings.addressAddedError);
      }
    } else {
      //Save
      userAddress.address = address;
      userAddress.company = company;
      userAddress.city = city;
      userAddress.country = country;
      userAddress.state = province;
      userAddress.zipcode = zipcode;
      bool updated = await addressList.update(userAddress);
      if(updated) {
        Fluttertoast.showToast(msg: CommonStrings.addressUpdatedSuccess);
      } else {
        Fluttertoast.showToast(msg: ErrorStrings.addressUpdatedError);
      }
    }
    Navigator.pushReplacementNamed(context, NavigationRoutes.addressRoute);
  }
}
