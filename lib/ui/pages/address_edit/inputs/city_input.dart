import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button_notifier.dart';
import 'package:provider/provider.dart';

class CityEditingController extends TextEditingController {}

class CityInput extends StatefulWidget {
  const CityInput({
    Key? key,
  }) : super(key: key);

  @override
  State<CityInput> createState() => _CityInputState();
}

class _CityInputState extends State<CityInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onInputChanged,
      textCapitalization: TextCapitalization.sentences,
      controller: Provider.of<CityEditingController>(context),
      decoration: const InputDecoration(
        hintText: AddressEditPageStrings.cityHint,
      ),
    );
  }

  void onInputChanged(String newValue) {
    bool isValid = newValue.isNotEmpty;
    Provider.of<SaveAddButtonNotifier>(context, listen: false).setCityValid(isValid);
  }
}