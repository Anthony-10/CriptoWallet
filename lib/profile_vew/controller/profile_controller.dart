
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/auth/view/auth_view.dart';
import 'package:new_crypto_wallet/auth/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{

  final authController = Get.find<AuthController>();


  LoginStatus()async{
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    if(prefs.getBool("loginWithFinger") != true){
      IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () async {
          Get.toEnd(() => AuthView());
        },
      );
    } else{
      // IconButton(
      //   icon: const Icon(Icons.exit_to_app),
      //   onPressed: () async {
      //     authController.signOut(() {
      //       Get.toEnd(() => Login());
      //     });
      //   },
      // );
    }
  }

}