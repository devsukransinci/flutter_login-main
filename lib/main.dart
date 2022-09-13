import 'package:flutter/material.dart';
import 'package:flutter_login/data/user_address/user_address_list.dart';
import 'package:flutter_login/ui/app_theme.dart';
import 'package:flutter_login/ui/pages/login/login_page.dart';
import 'package:flutter_login/ui/pages/address_list/address_list_page.dart';
import 'package:flutter_login/ui/pages/address_edit/address_edit_page.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/data/country/country_map.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'data/rebag_api.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  CountryMap cachedCountryInfo = CountryMap();

  @override
  Widget build(BuildContext context) {
    final api = RebagApi();
    api.retrieveCountryMap(cachedCountryInfo);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserAddressList()),
        Provider(create: (context) => cachedCountryInfo),
      ],
      child: MaterialApp(
        initialRoute: NavigationRoutes.loginRoute,
        routes: {
          NavigationRoutes.loginRoute: (context) => LoginPage(),
          NavigationRoutes.addressRoute: (context) => const AddressListPage(),
          NavigationRoutes.addressEditRoute: (context) => AddressEditPage(),
        },
        theme: appMainTheme,
      ),
    );
  }
}


