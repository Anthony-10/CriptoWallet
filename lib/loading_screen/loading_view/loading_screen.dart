import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/register_status/register_statuse.dart';
import 'package:new_crypto_wallet/slideScreen/screen_b.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int initScreen;

  @override
  void initState() {
    super.initState();
    _getStatusPref();

    Timer(
        const Duration(seconds: 3),
        () => Get.to(()=> initScreen == 0 || initScreen == null
            ? ScreenB()
            : RegisterStatus()));
  }

  Future<void> _getStatusPref() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    initScreen = preferences.getInt('initScreen');
    await preferences.setInt('initScreen', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Text(
          "G-Market",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0, color: Colors.amberAccent),
        )));
  }
}
