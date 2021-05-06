import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/all_coins/binding/all_coins_binding.dart';
import 'package:new_crypto_wallet/auth/binding/auth_binding.dart';
import 'package:new_crypto_wallet/auth/register_status/register_statuse.dart';
import 'package:new_crypto_wallet/auth/view/login.dart';
import 'package:new_crypto_wallet/auth/view/register.dart';
import 'package:new_crypto_wallet/core/widget/bottom_nav.dart';
import 'package:new_crypto_wallet/home_vew/binding/coins_binding.dart';
import 'package:new_crypto_wallet/profile_vew/view/profile_view.dart';

import 'favorite_add/binding/favorite_coin_binding.dart';
import 'favorite_add/view/favorite_coin_view.dart';
import 'home_vew/view/coins_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/login", page: () => Login(), binding: AuthBinding()),
        GetPage(
            name: "/register", page: () => Register(), binding: AuthBinding()),
        GetPage(
            name: "/registerStatus",
            page: () => RegisterStatus(),
            bindings: [AuthBinding(), AllCoinsBinding(), CoinsBinding()]),
        GetPage(
            name: "/coin_view",
            page: () => CoinsView(),
            bindings: [AllCoinsBinding(), CoinsBinding()]),
        GetPage(
            name: "/favorite_coins_view",
            page: () => FavoriteCoinsView(),
            binding: FavoriteCoinBinding()),
        GetPage(
            name: "/Profile_view",
            page: () => ProfileView(),
            binding: AuthBinding()),

        GetPage(name: "/Coins_search_view", page: () => ProfileView()),
        GetPage(
            name: "/bottom_nav",
            page: () => BottomNav(),
            bindings: [AllCoinsBinding(), CoinsBinding()])
      ],
      initialRoute: "/registerStatus",
    );
  }
}
