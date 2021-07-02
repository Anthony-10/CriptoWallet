import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/all_coins/binding/all_coins_binding.dart';
import 'package:new_crypto_wallet/all_coins/view/all_coins_view.dart';
import 'package:new_crypto_wallet/auth/binding/auth_binding.dart';
import 'package:new_crypto_wallet/auth/register_status/register_statuse.dart';
import 'package:new_crypto_wallet/auth/view/login.dart';
import 'package:new_crypto_wallet/auth/view/register.dart';
import 'package:new_crypto_wallet/core/binding/core_binding.dart';
import 'package:new_crypto_wallet/core/widget/bottom_nav/bottom_nav_binding.dart';
import 'package:new_crypto_wallet/core/widget/bottom_nav/bottom_nav_view.dart';
import 'package:new_crypto_wallet/home_vew/binding/coins_binding.dart';
import 'package:new_crypto_wallet/loading_screen/loading_view/loading_screen.dart';
import 'package:new_crypto_wallet/profile_vew/view/profile_view.dart';
import 'package:new_crypto_wallet/search_coins/binding/search_view_binding.dart';
import 'package:new_crypto_wallet/search_coins/view/search_view.dart';

import 'favorite_add/binding/favorite_coin_binding.dart';
import 'favorite_add/view/favorite_coin_view.dart';
import 'home_vew/view/coins_view.dart';
import 'majors_coins/binding/major_coins_binding.dart';
import 'majors_coins/view/major_coins_view.dart';

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
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      getPages: [
        GetPage(
            name: "/loading_screen",
            page: () => LoadingScreen(),
            bindings: [
              AuthBinding(),
              MajorCoinsViewBinding(),
              BottomNavBinding(),
            ]),
       /* GetPage(name: "/login", page: () => Login(), binding: AuthBinding()),
        GetPage(
            name: "/register",
            page: () => Register(),
            bindings: [AuthBinding()]),*/
        GetPage(
            name: "/registerStatus",
            page: () => RegisterStatus(),
            bindings: [
              AuthBinding(),
              AllCoinsBinding(),
              // CoinsBinding(),
              MajorCoinsViewBinding(),
              CoreBinding()
            ]),
        GetPage(name: "/coin_view", page: () => CoinsView(), bindings: [
          AllCoinsBinding(),
          //CoinsBinding(),
          MajorCoinsViewBinding(),
          CoreBinding()
        ]),
        GetPage(
            name: "/favorite_coins_view",
            page: () => FavoriteCoinsView(),
            binding: FavoriteCoinBinding()),
        GetPage(
            name: "/all_coins_view",
            page: () => AllCoinsView(),
            bindings: [AllCoinsBinding(), CoreBinding()]),
        GetPage(
            name: "/Profile_view",
            page: () => ProfileView(),
            binding: AuthBinding()),
        GetPage(
            name: "/major_coin_view",
            page: () => MajorCoinView(),
            bindings: [MajorCoinsViewBinding(), CoreBinding()]),
        GetPage(name: "/profile_view", page: () => ProfileView()),
        GetPage(
            name: "/search_coin_view",
            page: () => SearchCoinView(),
            binding: SearchBinding()),
        GetPage(name: "/bottom_nav", page: () => BottomNav(), bindings: [
          AllCoinsBinding(),
          CoinsBinding(),
          MajorCoinsViewBinding(),
          CoreBinding(),
          BottomNavBinding(),
        ])
      ],
      initialRoute: "/loading_screen",
    );
  }
}
