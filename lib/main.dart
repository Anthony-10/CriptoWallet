import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/widget/bottom_nav.dart';
import 'package:new_crypto_wallet/home_add/binding/search_coin_binding.dart';
import 'package:new_crypto_wallet/home_add/view/search_coin_view.dart';
import 'package:new_crypto_wallet/home_vew/binding/coins_binding.dart';

import 'home_vew/view/coins_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/coin_view", page: () => CoinsView(), binding: CoinsBinding() ),
        GetPage(name: "/Coins_search_view", page: () => CoinsSearchView(), binding: SearchCoinBinding()),
        GetPage(name: "/bottom_nav", page: () => BottomNav(), binding: CoinsBinding())
      ],
      initialRoute: "/bottom_nav",
    );
  }
}