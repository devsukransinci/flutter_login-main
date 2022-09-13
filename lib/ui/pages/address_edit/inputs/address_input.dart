import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/ui/pages/address_edit/save_add_button/save_add_button_notifier.dart';
import 'package:provider/provider.dart';

class AddressEditingController extends TextEditingController {}

class AddressInput extends StatefulWidget {
  const AddressInput({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onInputChanged,
      textCapitalization: TextCapitalization.sentences,
      controller: Provider.of<AddressEditingController>(context),
      decoration: const InputDecoration(
        hintText: AddressEditPageStrings.addressHint,
      ),
    );
  }

  void onInputChanged(String newValue) {
    bool isValid = newValue.isNotEmpty;
    Provider.of<SaveAddButtonNotifier>(this.context, listen: false).setAddressValid(isValid);
  }
}