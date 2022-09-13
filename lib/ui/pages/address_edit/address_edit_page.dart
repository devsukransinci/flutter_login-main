import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/data/country/country_notifier.dart';
import 'package:flutter_login/data/province/province_notifier.dart';
import 'package:flutter_login/data/user_address/user_address.dart';
import 'package:flutter_login/ui/app_bar.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button_notifier.dart';
import 'package:provider/provider.dart';

import 'inputs/address_input.dart';
import 'inputs/city_input.dart';
import 'inputs/company_input.dart';
import 'inputs/country_input.dart';
import 'inputs/province_input.dart';
import 'inputs/zip_input.dart';

class AddressPageArguments {
  UserAddress? userAddress;

  AddressPageArguments(this.userAddress);
}

class AddressEditPage extends StatefulWidget {
  AddressEditPage({Key? key, this.userAddress}) : super(key: key);

  UserAddress? userAddress;

  @override
  State<AddressEditPage> createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  var addressControl = AddressEditingController();
  var companyControl = CompanyEditingController();
  var cityControl = CityEditingController();
  var zipControl = ZipCodeEditingController();

  var countrySelected = CountryNotifier();
  var provinceSelected = ProvinceNotifier();
  var saveAddButtonNotifier = SaveAddButtonNotifier();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AddressPageArguments;
    widget.userAddress = args.userAddress;

    if (widget.userAddress != null) {
      setValuesFromAddress(widget.userAddress!);
      saveAddButtonNotifier.setAllValid(true);
    }
    return MultiProvider(
      providers: [
        Provider(create: (context) => widget.userAddress),
        ChangeNotifierProvider(create: (context) => saveAddButtonNotifier),
        ChangeNotifierProvider(create: (context) => addressControl),
        ChangeNotifierProvider(create: (context) => companyControl),
        ChangeNotifierProvider(create: (context) => cityControl),
        ChangeNotifierProvider(create: (context) => zipControl),
        ChangeNotifierProvider(create: (context) => countrySelected),
        ChangeNotifierProvider(create: (context) => provinceSelected),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(AppSizes.addressEditColumnPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const AddressInput(),
                  defaultAddressPadding,
                  const CompanyInput(),
                  defaultAddressPadding,
                  const CityInput(),
                  defaultAddressPadding,
                  CountryDropDown(),
                  defaultAddressPadding,
                  ProvinceDropDown(),
                  defaultAddressPadding,
                  const ZipInput(),
                  const Padding(padding: EdgeInsets.all(AppSizes.addressEditButtonPadding)),
                  const SaveAddButton(),
                ]),
          )),
    );
  }

  void setValuesFromAddress(UserAddress inAddress) {
    addressControl.text = inAddress.address;
    if (inAddress.company != null) {
      companyControl.text = inAddress.company!;
    }
    cityControl.text = inAddress.city;
    zipControl.text = inAddress.zipcode;
  }
}

const defaultAddressPadding = Padding(padding: EdgeInsets.all(AppSizes.addressEditInputPadding));
