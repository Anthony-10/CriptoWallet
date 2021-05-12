import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/all_coins/binding/all_coins_binding.dart';
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
        () => Get.to(
              () => initScreen == 0 || initScreen == null
                  ? ScreenB()
                  : RegisterStatus(),
              binding: AllCoinsBinding(),
            ));
  }

  Future<void> _getStatusPref() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    initScreen = preferences.getInt('initScreen');
    await preferences.setInt('initScreen', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/cripto1.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Align(
            alignment: Alignment(0.0, -0.6),
            child: Text(
              "Finexness",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: Colors.amberAccent),
            ),
          ),
        ),
      ],
    );
    /*Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/cripto1.jpg'), fit: BoxFit.fill)),
            child: Align(
              alignment: Alignment(0.2, 0.6),
              child: Text(
                "Finexness",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.amberAccent),
              ),
            ));*/
  }
}
