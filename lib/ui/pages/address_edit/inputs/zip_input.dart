import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button_notifier.dart';
import 'package:provider/provider.dart';

class ZipCodeEditingController extends TextEditingController {}

class ZipInput extends StatefulWidget {
  const ZipInput({
    Key? key,
  }) : super(key: key);

  @override
  State<ZipInput> createState() => _ZipInputState();
}

class _ZipInputState extends State<ZipInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onInputChanged,
      controller: Provider.of<ZipCodeEditingController>(context),
      decoration: const InputDecoration(
        hintText: AddressEditPageStrings.zipHint,
      ),
    );
  }

  void onInputChanged(String newValue) {
    bool isValid = newValue.isNotEmpty;
    Provider.of<SaveAddButtonNotifier>(context, listen: false).setZipValid(isValid);
  }
}