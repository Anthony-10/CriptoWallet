import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/auth/view/login.dart';
import 'package:new_crypto_wallet/core/widget/bottom_nav.dart';
import 'package:new_crypto_wallet/majors_coins/controller/major_coins_controller.dart';

class RegisterStatus extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final majorcoinscontroller = Get.find<MajorCoinsController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (authController.user != null) ? BottomNav() : Login();
    });
  }
}
