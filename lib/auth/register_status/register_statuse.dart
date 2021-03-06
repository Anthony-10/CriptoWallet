import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/auth/view/local_authentication.dart';
import 'package:new_crypto_wallet/auth/view/login.dart';

class RegisterStatus extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (authController.user != null) ? LocalAuthentication() : Login();
    });
  }
}
