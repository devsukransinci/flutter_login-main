import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:provider/provider.dart';

class CompanyEditingController extends TextEditingController {}

class CompanyInput extends StatelessWidget {
  const CompanyInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: Provider.of<CompanyEditingController>(context),
      decoration: const InputDecoration(
        hintText: AddressEditPageStrings.companyHint,
      ),
    );
  }
}