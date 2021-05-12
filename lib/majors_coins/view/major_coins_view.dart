import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/majors_coins/controller/major_coins_controller.dart';

class MajorCoinView extends StatefulWidget {
  const MajorCoinView({Key key}) : super(key: key);

  @override
  _MajorCoinViewState createState() => _MajorCoinViewState();
}

class _MajorCoinViewState extends State<MajorCoinView> {
  final majorCoinsController = Get.find<MajorCoinsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (majorCoinsController.isLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (majorCoinsController.major_cryptos == null) {
          return Center(child: Text("Check your internet connection"));
        }
        return majorCoinsController.listCryptos(context);
      }),
    );
  }
}
