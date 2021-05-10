import 'dart:async';

import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/register_status/register_statuse.dart';
import 'package:new_crypto_wallet/slideScreen/screen_b.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingController extends GetxController {
  // int initScreen;
  //
  // LoadingController() {
  //   _getStatusPref();
  //   Timer(const Duration(seconds: 3),
  //       () => initScreen == 0 || initScreen == null ? ScreenB() : RegisterStatus());
  // }
  // Future<void> _getStatusPref() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   initScreen = preferences.getInt('initScreen');
  //   await preferences.setInt('initScreen', 1);
  // }
}
