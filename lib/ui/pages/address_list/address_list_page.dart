import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/data/rebag_api.dart';
import 'package:flutter_login/data/user_address/user_address.dart';
import 'package:flutter_login/data/user_address/user_address_list.dart';
import 'package:flutter_login/ui/app_bar.dart';
import 'package:flutter_login/ui/app_theme.dart';
import 'package:flutter_login/ui/pages/address_edit/address_edit_page.dart';
import 'package:provider/provider.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AddressPageHeader(),
          const Divider(height: 20, thickness: 1, color: Colors.black),
          Expanded(child: AddressList()),
        ],
      ),
    );
  }
}

class AddressPageHeader extends StatelessWidget {
  AddressPageHeader({Key? key}) : super(key: key);

  BuildContext? currentContext;

  @override
  Widget build(BuildContext context) {
    currentContext = context;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(AddressListPageStrings.title, style: addresTitleTextStyle),
          TextButton(
            onPressed: onAddPressed,
            child: const Text(AddressListPageStrings.addButton,
                style: addAddressTextStyle),
          )
        ],
      ),
    );
  }

  void onAddPressed() {
    Navigator.pushNamed(currentContext!, NavigationRoutes.addressEditRoute,
        arguments: AddressPageArguments(null));
  }
}

class AddressList extends StatefulWidget {
  AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserAddressList>(builder: (context, addressList, child) {
      return FutureBuilder<UserAddressList>(
          future: RebagApi().retrieveAddressList(),
          builder:
              (BuildContext context, AsyncSnapshot<UserAddressList> snapshot) {
            Widget? result;
            if (snapshot.hasData) {
              var addressList = snapshot.data!.list;
              result = ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: addressList
                    .map((address) => AddressCard(userAddress: address))
                    .toList(),
              );
            } else {
              result = const Center(
                child: CircularProgressIndicator(),
              );
            }
            return result;
          });
    });
  }
}

class AddressCard extends StatefulWidget {
  AddressCard({Key? key, required this.userAddress}) : super(key: key);

  UserAddress userAddress;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.addressListCardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: Text(widget.userAddress.toString()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppSizes.addressListEditButtonWidth,
                  height: AppSizes.addressListEditButtonHeight,
                  child: OutlinedButton(
                    style: addressCardEditStyle,
                    onPressed: onEditPressed,
                    child: const Text(
                      AddressListPageStrings.editButton,
                      style: addressListButtonTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: TextButton(
                    onPressed: onDeletePressed,
                    child: const Text(AddressListPageStrings.deleteButton,
                        style: addressListButtonTextStyle),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void onEditPressed() {
    Navigator.pushNamed(context, NavigationRoutes.addressEditRoute,
        arguments: AddressPageArguments(widget.userAddress));
  }

  void onDeletePressed() {}
}
